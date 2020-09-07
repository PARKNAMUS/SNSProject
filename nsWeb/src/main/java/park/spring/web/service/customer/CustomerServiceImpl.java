package park.spring.web.service.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import park.spring.web.dao.customer.CustomerDAOImpl;
import park.spring.web.vo.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDAOImpl customerDAOImpl;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	@Override
	public int EmailCheck(String email) {
		return customerDAOImpl.EmailCheck(email);
	}
	@Override
	public void insertAccount(CustomerVO vo) {
		vo.setPassword(bcryptPasswordEncoder.encode(vo.getPassword()));
		customerDAOImpl.insertAccount(vo);
	}
	@Override
	public String loginCheck(CustomerVO vo) {
		String returnStr = "";
		CustomerVO getvo = customerDAOImpl.loginCheck(vo.getEmail());
		String enPass = getvo.getPassword();
		if(enPass == null ||enPass.equals("")) {
			returnStr = "idfail";
		}else {
			if(getvo.getStatus() == 0) {
				if(bcryptPasswordEncoder.matches(vo.getPassword(), enPass)) {
					returnStr = "success";
				}else {
					returnStr = "passfail";
				}
			}else {
				returnStr = "statusfail";
			}
		}
		
		return returnStr;
	}
	@Override
	public void uploadProfileImg(CustomerVO vo) {
		customerDAOImpl.uploadProfileImg(vo);
	}
	@Override
	public void updateProfile(CustomerVO vo) {
		customerDAOImpl.updateProfile(vo);
		
	}
	@Override
	public CustomerVO getCustomer(String email) {
		return customerDAOImpl.getCustomer(email);
	}
	@Override
	public String changePassword(String id, String oldpw, String newpw) {
		CustomerVO getvo = customerDAOImpl.loginCheck(id);
		String enpass = getvo.getPassword();
		if(bcryptPasswordEncoder.matches(oldpw, enpass)) {
			CustomerVO vo = new CustomerVO();
			vo.setEmail(id);
			vo.setPassword(bcryptPasswordEncoder.encode(newpw));
			customerDAOImpl.changePassword(vo);
			return "success";
		}else {
			return "fail";
		}
	}
	@Override
	public void setTempPassword(String email,String pw) {
			CustomerVO vo = new CustomerVO();
			vo.setEmail(email);
			vo.setPassword(bcryptPasswordEncoder.encode(pw));
			customerDAOImpl.changePassword(vo);
			
	}
	@Override
	public String changeStatus(String email,String password) {
		String enpass = customerDAOImpl.getPassword(email);
		if(bcryptPasswordEncoder.matches(password, enpass)) {
			customerDAOImpl.changeStatus(email);
			return "success";
		}else {
			return "fail";
		}	
	}

}
