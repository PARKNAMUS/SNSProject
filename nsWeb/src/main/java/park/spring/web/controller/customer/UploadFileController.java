package park.spring.web.controller.customer;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import park.spring.web.service.customer.CustomerServiceImpl;
import park.spring.web.vo.CustomerVO;

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
}
