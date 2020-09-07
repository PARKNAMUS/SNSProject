package park.spring.web.dao.index;

import java.util.List;

import park.spring.web.vo.CustomerVO;

public interface IndexDao {
	
	public List<CustomerVO> getSearchUser(String search);
}
