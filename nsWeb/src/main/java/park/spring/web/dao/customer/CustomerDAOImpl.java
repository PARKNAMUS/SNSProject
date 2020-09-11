package park.spring.web.dao.customer;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import park.spring.web.vo.CustomerVO;
import park.spring.web.vo.FollowVO;
import park.spring.web.vo.PostVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String mbId = "CustomerDAO.";
	
	@Override
	public int EmailCheck(String email) {
		return sqlSessionTemplate.selectOne(mbId+"emailCheck",email);
	}

	@Override
	public void insertAccount(CustomerVO vo) {
		sqlSessionTemplate.insert(mbId+"insertAccount",vo);
		
	}

	@Override
	public CustomerVO loginCheck(String email) {
		return sqlSessionTemplate.selectOne(mbId+"loginCheck",email);
	}

	@Override
	public void uploadProfileImg(CustomerVO vo) {
		sqlSessionTemplate.update(mbId+"updateProfileImg",vo);
	}

	@Override
	public void updateProfile(CustomerVO vo) {
		sqlSessionTemplate.update(mbId+"updateProfile",vo);
		
	}

	@Override
	public CustomerVO getCustomer(String email) {
		return sqlSessionTemplate.selectOne(mbId+"getCustomer",email);
	}

	@Override
	public void changePassword(CustomerVO vo) {
		sqlSessionTemplate.update(mbId+"changePassword",vo);
	}

	@Override
	public void changeStatus(String email) {
		sqlSessionTemplate.update(mbId+"changeStatus",email);
		
	}

	@Override
	public String getPassword(String email) {
		return sqlSessionTemplate.selectOne(mbId+"getPassword",email);
	}

	@Override
	public void uploadPost(PostVO vo) {
		sqlSessionTemplate.insert(mbId+"uploadPost",vo);
	}

	@Override
	public void follow(FollowVO vo) {
		sqlSessionTemplate.insert(mbId+"follow",vo);
	}

	@Override
	public int checkFollow(FollowVO vo) {
		return sqlSessionTemplate.selectOne(mbId+"checkFollow",vo);
	}

	@Override
	public void unfollow(FollowVO vo) {
		sqlSessionTemplate.delete(mbId+"unfollow",vo);
		
	}

	@Override
	public List<PostVO> getMyPost(String email) {
		return sqlSessionTemplate.selectList(mbId+"getMyPost",email);
	}

	

}
