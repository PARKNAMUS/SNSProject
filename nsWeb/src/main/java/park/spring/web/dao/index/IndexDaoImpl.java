package park.spring.web.dao.index;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import park.spring.web.vo.CustomerVO;
import park.spring.web.vo.PostVO;

@Repository
public class IndexDaoImpl implements IndexDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String mbId = "indexDAO.";
	@Override
	public List<CustomerVO> getSearchUser(String search) {
		return sqlSessionTemplate.selectList(mbId+"getSearchUser",search);
	}
	@Override
	public List<PostVO> getPost(String email) {
		return sqlSessionTemplate.selectList(mbId+"getPost",email);
	}
	@Override
	public String getImage(int post_seq) {
		return sqlSessionTemplate.selectOne(mbId+"getImage",post_seq);
	}

}
