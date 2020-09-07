package park.spring.web.service.customer;

import park.spring.web.vo.CustomerVO;

public interface CustomerService {
	public int EmailCheck(String email);
	public void insertAccount(CustomerVO vo);
	public String loginCheck(CustomerVO vo);
	public void uploadProfileImg(CustomerVO vo);
	public void updateProfile(CustomerVO vo);
	public CustomerVO getCustomer(String email);
	public String changePassword(String id,String oldpw,String newpw);
	public String changeStatus(String email,String password);
	public void setTempPassword(String email,String pw);
}
