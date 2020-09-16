package park.spring.web.service.index;

import java.util.List;

import oracle.jdbc.proxy.annotation.Post;
import park.spring.web.vo.CommentsVO;
import park.spring.web.vo.CustomerVO;
import park.spring.web.vo.PostLikeVO;
import park.spring.web.vo.PostSaveVO;
import park.spring.web.vo.PostVO;

public interface IndexService {
	public List<CustomerVO> getSearchUser(String search);
	public List<PostVO> getPost(String email);
	public String getImage(int post_seq);
	public void insertComment(CommentsVO vo);
	public void deletePost(int post_seq);
	public List<CommentsVO> getComments(int post_seq);
	public void beLike(PostLikeVO vo);
	public void unLike(PostLikeVO vo);
	public void save(PostSaveVO vo);
	public void unsave(PostSaveVO vo);
	public List<CustomerVO> recommend(String email);
	public PostVO getSpecPost(int post_seq);
}
