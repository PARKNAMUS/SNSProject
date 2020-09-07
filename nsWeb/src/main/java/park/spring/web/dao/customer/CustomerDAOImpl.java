package park.spring.web.dao.customer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import park.spring.web.vo.CustomerVO;

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

}
