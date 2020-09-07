package park.spring.web.controller.customer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import park.spring.common.TempKey;
import park.spring.web.service.customer.CustomerServiceImpl;
import park.spring.web.service.mail.MailService;
import park.spring.web.service.mail.MailServiceImpl;
import park.spring.web.vo.CustomerVO;

@Controller
public class UserController {
	@Autowired
	private MailServiceImpl mailServiceImpl;
	@Autowired
	private CustomerServiceImpl customerServiceImpl;
	
	@RequestMapping(value = "/signupProcess.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String signupProcessController(@RequestParam String email) {
		if(customerServiceImpl.EmailCheck(email) < 1) {
			String authCode = new TempKey().generateKey(8);
			String subject = "Oracle 회원가입 인증코드 발급 안내";
			String text = "귀하의 인증코드는 "+authCode+"입니다.";
			mailServiceImpl.send(subject, text, "skatn7979@gmail.com", email, null);
			return authCode;
		}else {
			return "fail";
		}
	}
	@RequestMapping("/signupSuccess.do")
	public ModelAndView signupSuccessController(CustomerVO vo,ModelAndView mav) {
		customerServiceImpl.insertAccount(vo);
		mav.addObject("createCheck","true");
		mav.setViewName("login");
		return mav;
	}
	@RequestMapping(value = "/loginProcess.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String loginProcess(CustomerVO vo) {
		System.out.println(customerServiceImpl.loginCheck(vo));
		return customerServiceImpl.loginCheck(vo);
	}
	@RequestMapping("/loginSuccess.do")
	public ModelAndView loginController(CustomerVO vo,ModelAndView mav,HttpSession session) {
		if(session.getAttribute("login_id") == null) {
			session.setAttribute("login_id", vo.getEmail());
		}
		
		CustomerVO myvo = customerServiceImpl.getCustomer((String)session.getAttribute("login_id"));
		session.setAttribute("myimg", myvo.getProfile_img());
		mav.addObject("customer",myvo);
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping("/profile.do")
	public ModelAndView profilePageController(ModelAndView mav,HttpSession session) {
		mav.addObject("customer",customerServiceImpl.getCustomer((String)session.getAttribute("login_id")));
		mav.setViewName("profile");
		return mav;
	}
	@RequestMapping("/userProfile.do")
	public ModelAndView userProfileController(@RequestParam("email") String email,ModelAndView mav ) {
		mav.addObject("customer",customerServiceImpl.getCustomer(email));
		mav.setViewName("profile");
		return mav;
	}
	@RequestMapping("/loginPage.do")
	public String loginPage() {
		return "login";
	}
	@RequestMapping("/signup.do")
	public String signupPage() {
		return "signup";
	}
	@RequestMapping("/profileset.do")
	public ModelAndView profileSetPage(ModelAndView mav,HttpSession session) {
		mav.addObject("customer",customerServiceImpl.getCustomer((String)session.getAttribute("login_id")));
		mav.setViewName("profileset");
		return mav;
	}
	@RequestMapping("/changePw.do")
	public ModelAndView changePwPage(ModelAndView mav,HttpSession session) {
		mav.addObject("customer",customerServiceImpl.getCustomer((String)session.getAttribute("login_id")));
		mav.setViewName("changepw");
		return mav;
	}

	@RequestMapping("/invalAccount.do")
	public ModelAndView invalAccountPage(ModelAndView mav,HttpSession session) {
		mav.addObject("customer",customerServiceImpl.getCustomer((String)session.getAttribute("login_id")));
		mav.setViewName("invalaccount");
		return mav;
	}
	@RequestMapping("/updateProfile.do")
	public String updateProfileController(CustomerVO vo,HttpSession session) {
		vo.setEmail((String)session.getAttribute("login_id"));
		customerServiceImpl.updateProfile(vo);
		return "redirect:profileset.do";
	}
	@RequestMapping(value = "/changePassword.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String changePasswordController(HttpSession session, @RequestParam("oldpw") String oldpw,@RequestParam("newpw") String newpw) {
		return customerServiceImpl.changePassword((String)session.getAttribute("login_id"), oldpw, newpw);
	}
	@RequestMapping("statusChange.do")
	public ModelAndView changeStatusController(@RequestParam("email") String email,ModelAndView mav,HttpSession session) {
		CustomerVO vo = customerServiceImpl.getCustomer(email);
		session.setAttribute("login_id",email);
		mav.addObject("customer",vo);
		mav.setViewName("statusPage");
		return mav;
	}
	@RequestMapping(value = "/changeStatus.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String changeStatusController(HttpSession session,@RequestParam("password") String password) {
		String result = customerServiceImpl.changeStatus((String)session.getAttribute("login_id"),password);
		if(result.equals("success")) {
			session.invalidate();	
		}		
		return result;
	}
	@RequestMapping("logout.do")
	public String logoutController(HttpSession session) {
		session.invalidate();
		return "login";
	}
	@RequestMapping(value = "getTempPass.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String getTempPassController(@RequestParam("email") String email) {
		int result = customerServiceImpl.EmailCheck(email);
		if(result<1) {
			return "fail";
		}else {
			String authCode = new TempKey().generateKey(8);
			String subject = "Oracle 임시 비밀번호 발급 안내";
			String text = "귀하의 임시 비밀번호는 "+authCode+" 입니다.";
			mailServiceImpl.send(subject, text, "skatn7979@gmail.com",email, null);
			customerServiceImpl.setTempPassword(email, authCode);
			return "success";
		}

	}
	
}
