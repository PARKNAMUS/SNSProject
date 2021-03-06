package park.spring.web.controller.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import park.spring.common.TempKey;
import park.spring.web.service.customer.CustomerServiceImpl;
import park.spring.web.service.index.IndexServiceImpl;
import park.spring.web.service.mail.MailService;
import park.spring.web.service.mail.MailServiceImpl;
import park.spring.web.vo.CustomerVO;
import park.spring.web.vo.FollowVO;
import park.spring.web.vo.PostVO;

@Controller
public class UserController {
	@Autowired
	private MailServiceImpl mailServiceImpl;
	@Autowired
	private CustomerServiceImpl customerServiceImpl;
	@Autowired
	private IndexServiceImpl indexServiceImpl;
	
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
			if(vo.getEmail() == null) {
				mav.setViewName("login");
				return mav;
			}else {
				session.setAttribute("login_id", vo.getEmail());
			}
		}
		CustomerVO myvo = customerServiceImpl.getCustomer((String)session.getAttribute("login_id"));
		if(session.getAttribute("myimg") == null) {
			session.setAttribute("myimg", myvo.getProfile_img());
		}
		List<CustomerVO> rlist = indexServiceImpl.recommend((String)session.getAttribute("login_id"));
		if(rlist.size()>0) {
			mav.addObject("recommend",rlist);
		}
		mav.addObject("post",indexServiceImpl.getPost((String)session.getAttribute("login_id")));
		mav.addObject("customer",myvo);
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping("/profile.do")
	public ModelAndView profilePageController(ModelAndView mav,HttpSession session,@RequestParam("type") String type) {
		if(type.equals("my")) {
			mav.addObject("post",customerServiceImpl.getMyPost((String)session.getAttribute("login_id")));
		}
		else if(type.equals("save")) {
			mav.addObject("post",customerServiceImpl.getMySavePost((String)session.getAttribute("login_id")));
		}
		mav.addObject("customer",customerServiceImpl.getCustomer((String)session.getAttribute("login_id")));
		mav.addObject("type",type);
		mav.addObject("postnum",customerServiceImpl.getMyPost((String)session.getAttribute("login_id")).size());
		mav.setViewName("profile");
		return mav;
	}
	@RequestMapping("/userProfile.do")
	public ModelAndView userProfileController(@RequestParam("email") String email,HttpSession session,@RequestParam("type") String type,ModelAndView mav ) {
		CustomerVO vo = customerServiceImpl.getCustomer(email);
		FollowVO fvo = new FollowVO();
		fvo.setFollowing(vo.getEmail());
		fvo.setFollower((String)session.getAttribute("login_id"));
		vo.setFollowStatus(customerServiceImpl.checkFollow(fvo));
		mav.addObject("customer",vo);
		if(type.equals("my")) {
			mav.addObject("post",customerServiceImpl.getMyPost(email));
		}else if(type.equals("save")) {
			mav.addObject("post",customerServiceImpl.getMySavePost(email));
		}
		mav.addObject("postnum",customerServiceImpl.getMyPost(email).size());
		mav.addObject("type",type);
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
	@RequestMapping("uploadPage.do")
	public String uploadPageController() {
		return "postupload";
	}
	@RequestMapping(value = "follow.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String followController(FollowVO vo,HttpSession session) {
		vo.setFollower((String)session.getAttribute("login_id"));
		customerServiceImpl.follow(vo);
		return "";
	}
	@RequestMapping(value = "unfollow.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String unfollowController(FollowVO vo,HttpSession session) {
		vo.setFollower((String)session.getAttribute("login_id"));
		customerServiceImpl.unfollow(vo);
		return "";
	}
	@RequestMapping(value = "getfollower.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String getFollowerController(@RequestParam("email") String email) throws JsonProcessingException {
		List<CustomerVO> list = customerServiceImpl.getFollower(email);
		ObjectMapper mapper = new ObjectMapper();
		String str = mapper.writeValueAsString(list);
		return str;
	}
	@RequestMapping(value = "getfollowing.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String getFollowingController(@RequestParam("email") String email) throws JsonProcessingException {
		List<CustomerVO> list = customerServiceImpl.getFollowing(email);
		ObjectMapper mapper = new ObjectMapper();
		String str = mapper.writeValueAsString(list);
		return str;
	}
}
