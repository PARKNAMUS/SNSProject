package park.spring.web.dao.customer;

import java.util.List;

import park.spring.web.vo.CustomerVO;
import park.spring.web.vo.FollowVO;
import park.spring.web.vo.PostVO;

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
	public void uploadPost(PostVO vo);
	public void follow(FollowVO vo);
	public int checkFollow(FollowVO vo);
	public void unfollow(FollowVO vo);
	public List<PostVO> getMyPost(String email);

}
