package park.spring.web.dao.customer;

import park.spring.web.vo.CustomerVO;

public interface CustomerDAO {
	
	public int EmailCheck(String email);
	public void insertAccount(CustomerVO vo);
	public CustomerVO loginCheck(String email);
	public void uploadProfileImg(CustomerVO vo);
	public void updateProfile(CustomerVO vo);
	public CustomerVO getCustomer(String email);
	public void changePassword(CustomerVO vo);
	public void changeStatus(String email);
	public String getPassword(String email);
}
