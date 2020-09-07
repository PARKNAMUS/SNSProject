package park.spring.web.dao.index;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import park.spring.web.vo.CustomerVO;

@Repository
public class IndexDaoImpl implements IndexDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String mbId = "indexDAO.";
	@Override
	public List<CustomerVO> getSearchUser(String search) {
		return sqlSessionTemplate.selectList(mbId+"getSearchUser",search);
	}

}
