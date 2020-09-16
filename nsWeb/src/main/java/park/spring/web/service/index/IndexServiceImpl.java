package park.spring.web.service.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.jdbc.proxy.annotation.Post;
import park.spring.web.dao.index.IndexDaoImpl;
import park.spring.web.vo.CommentsVO;
import park.spring.web.vo.CustomerVO;
import park.spring.web.vo.PostLikeVO;
import park.spring.web.vo.PostSaveVO;
import park.spring.web.vo.PostVO;

@Service
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	private IndexDaoImpl indexDaoImpl;
	@Override
	public List<CustomerVO> getSearchUser(String search) {
		return indexDaoImpl.getSearchUser(search);
	}
	@Override
	public List<PostVO> getPost(String email) {
		List<PostVO> vo = indexDaoImpl.getPost(email);
		for(int i=0;i<vo.size();i++) {
			vo.get(i).setImageList(vo.get(i).getPost_image().split(","));
		}
		return vo;
	}
	@Override
	public String getImage(int post_seq) {
		return indexDaoImpl.getImage(post_seq);
	}
	@Override
	public void insertComment(CommentsVO vo) {
		indexDaoImpl.insertComment(vo);
		
	}
	@Override
	public void deletePost(int post_seq) {
		indexDaoImpl.deletePost(post_seq);
	}
	@Override
	public List<CommentsVO> getComments(int post_seq) {
		return indexDaoImpl.getComments(post_seq);
	}
	@Override
	public void beLike(PostLikeVO vo) {
		indexDaoImpl.beLike(vo);
	}
	@Override
	public void unLike(PostLikeVO vo) {
		indexDaoImpl.unLike(vo);
	}
	@Override
	public void save(PostSaveVO vo) {
		indexDaoImpl.save(vo);
	}
	@Override
	public void unsave(PostSaveVO vo) {
		indexDaoImpl.unsave(vo);
	}
	@Override
	public List<CustomerVO> recommend(String email) {
		return indexDaoImpl.recommend(email);
	}
	@Override
	public PostVO getSpecPost(int post_seq) {
		PostVO vo = indexDaoImpl.getSpecPost(post_seq);
		vo.setImageList(vo.getPost_image().split(","));
		return vo;
	}

}
