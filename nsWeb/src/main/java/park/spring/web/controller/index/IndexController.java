package park.spring.web.controller.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import park.spring.web.service.index.IndexServiceImpl;
import park.spring.web.vo.CustomerVO;

@Controller
public class IndexController {
	
	@Autowired
	private IndexServiceImpl indexServiceImpl;
	
	@RequestMapping(value = "searchUser.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String getSearchUser(@RequestParam("searchKeyWord") String search) throws JsonProcessingException {
		List<CustomerVO> list = indexServiceImpl.getSearchUser(search);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	@RequestMapping(value = "getImage.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String getImageController(@RequestParam("post_seq") String post_seq) {
		
		return indexServiceImpl.getImage(Integer.parseInt(post_seq));
	}
}	
