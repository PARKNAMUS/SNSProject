package park.spring.web.controller.customer;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import park.spring.common.MediaUtil;
import park.spring.web.service.customer.CustomerServiceImpl;
import park.spring.web.vo.CustomerVO;
import park.spring.web.vo.PostVO;

@Controller
public class UploadFileController {
	@Autowired
	private CustomerServiceImpl customerServiceImpl;
	
	@RequestMapping("/changeProfileImg.do")
	public String profileImgPage() {
		return "profile_img";
	}
	@RequestMapping(value = "/uploadProfileImg.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String uploadProfileImgController(CustomerVO vo,HttpServletRequest request) throws IllegalStateException, IOException {
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/user/");
		MultipartFile uploadImg = vo.getUploadProfile();
		String fileName = null;
		if(!uploadImg.isEmpty()) {
			fileName = uploadImg.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			fileName = uuid.toString()+"_"+fileName;
			uploadImg.transferTo(new File(uploadPath+fileName));
		}
		return fileName;
	}
	@RequestMapping(value = "/FinaluploadProfileImg.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String finalUploadProfileImgController(CustomerVO vo,HttpSession session,HttpServletRequest request) {
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/user/");
		vo.setEmail((String)session.getAttribute("login_id"));
		CustomerVO getvo =  customerServiceImpl.getCustomer((String)session.getAttribute("login_id"));
		File file = new File(uploadPath+getvo.getProfile_img());
		if(file.exists()) {
			file.delete();
		}
		session.setAttribute("myimg",vo.getProfile_img());
		customerServiceImpl.uploadProfileImg(vo);
		return "변경되었습니다.";
	}
	@RequestMapping(value = "/deleteUploadFile.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteUploadFileController(@RequestParam String fileNames,HttpServletRequest request) {
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/user/");
		File file = new File(uploadPath+fileNames);
		if(file.exists()) {
			file.delete();
		}
		return "delete";
	}
	@RequestMapping("postUpload.do")
	public String uploadPostController(PostVO vo,HttpSession session, MultipartHttpServletRequest mtfRequest,HttpServletRequest request) throws IllegalStateException, IOException{
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/user/");
		List<MultipartFile> fileList = mtfRequest.getFiles("postimg");
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<fileList.size();i++) {
			String ofn = fileList.get(i).getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			ofn = uuid+ofn;
			fileList.get(i).transferTo(new File(uploadPath+ofn));
			if(i != 0) {
				sb.append(","+ofn);
			}else {
				sb.append(ofn);
			}
		}
		vo.setPost_uploader((String)session.getAttribute("login_id"));
		vo.setPost_image(sb.toString());
		customerServiceImpl.uploadPost(vo);
		return "redirect:loginSuccess.do";
	}
	@RequestMapping(value = "/getimg.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(@RequestParam("img")String fileName, HttpServletRequest request)throws Exception{
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/user/");
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtil.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if( in != null) {
				in.close();
			}
		}
		return entity;
	}
}
