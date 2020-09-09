package park.spring.web.service.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import park.spring.web.dao.index.IndexDaoImpl;
import park.spring.web.vo.CustomerVO;
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

}
