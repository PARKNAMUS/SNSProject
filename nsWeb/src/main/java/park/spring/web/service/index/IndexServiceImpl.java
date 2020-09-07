package park.spring.web.service.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import park.spring.web.dao.index.IndexDaoImpl;
import park.spring.web.vo.CustomerVO;

@Service
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	private IndexDaoImpl indexDaoImpl;
	@Override
	public List<CustomerVO> getSearchUser(String search) {
		return indexDaoImpl.getSearchUser(search);
	}

}
