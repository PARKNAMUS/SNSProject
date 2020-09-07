package park.spring.web.service.index;

import java.util.List;

import park.spring.web.vo.CustomerVO;

public interface IndexService {
	public List<CustomerVO> getSearchUser(String search);
}
