package park.spring.web.controller.customer;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import park.spring.web.service.customer.CustomerServiceImpl;
import park.spring.web.vo.CustomerVO;
import park.spring.web.vo.PostVO;

@Controller
public class UploadFileController {
	@Autowired
	private CustomerServiceImpl customerServiceImpl;
	
	private String pathName = "D:\\eclipses\\personalProject\\workspace\\nsWeb\\src\\main\\webapp\\resources\\images\\user\\";
	@RequestMapping("/changeProfileImg.do")
	public String profileImgPage() {
		return "profile_img";
	}
	@RequestMapping(value = "/uploadProfileImg.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String uploadProfileImgController(CustomerVO vo) throws IllegalStateException, IOException {
		MultipartFile uploadImg = vo.getUploadProfile();
		String fileName = null;
		if(!uploadImg.isEmpty()) {
			fileName = uploadImg.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			fileName = uuid.toString()+"_"+fileName;
			uploadImg.transferTo(new File(pathName+fileName));
		}
		return fileName;
	}
	@RequestMapping(value = "/FinaluploadProfileImg.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String finalUploadProfileImgController(CustomerVO vo,HttpSession session) {
		vo.setEmail((String)session.getAttribute("login_id"));
		CustomerVO getvo =  customerServiceImpl.getCustomer((String)session.getAttribute("login_id"));
		File file = new File(pathName+getvo.getProfile_img());
		if(file.exists()) {
			file.delete();
		}
		session.setAttribute("myimg",vo.getProfile_img());
		customerServiceImpl.uploadProfileImg(vo);
		return "변경되었습니다.";
	}
	@RequestMapping(value = "/deleteUploadFile.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteUploadFileController(@RequestParam String fileNames) {
		File file = new File(pathName+fileNames);
		if(file.exists()) {
			file.delete();
		}
		return "delete";
	}
	@RequestMapping("postUpload.do")
	public String uploadPostController(PostVO vo,HttpSession session, MultipartHttpServletRequest mtfRequest) throws IllegalStateException, IOException{
		List<MultipartFile> fileList = mtfRequest.getFiles("postimg");
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<fileList.size();i++) {
			String ofn = fileList.get(i).getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			ofn = uuid+ofn;
			fileList.get(i).transferTo(new File(pathName+ofn));
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
}
