package park.spring.web.service.customer;

import java.util.List;

import park.spring.web.vo.CustomerVO;
import park.spring.web.vo.FollowVO;
import park.spring.web.vo.PostVO;

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
	public void uploadPost(PostVO vo);
	public void follow(FollowVO vo);
	public int checkFollow(FollowVO vo);
	public void unfollow(FollowVO vo);
	
}
