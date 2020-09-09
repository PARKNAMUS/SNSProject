package park.spring.web.dao.index;

import java.util.List;

import park.spring.web.vo.CustomerVO;
import park.spring.web.vo.PostVO;

public interface IndexDao {
	
	public List<CustomerVO> getSearchUser(String search);
	public List<PostVO> getPost(String email);
	public String getImage(int post_seq);
}
