package park.spring.web.controller.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import park.spring.web.service.index.IndexServiceImpl;
import park.spring.web.vo.CommentsVO;
import park.spring.web.vo.CustomerVO;
import park.spring.web.vo.PostLikeVO;
import park.spring.web.vo.PostSaveVO;

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
	@RequestMapping(value = "insertComment.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertCommentsController(CommentsVO vo) {
		vo.setCommnets_post_seq(Integer.parseInt(vo.getPost_seq_str()));
		indexServiceImpl.insertComment(vo);
		return "";
	}
	@RequestMapping(value = "deletePost.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String deletePostController(@RequestParam("post_seq") String post_seq) {
		indexServiceImpl.deletePost(Integer.parseInt(post_seq));
		return "";
	}
	@RequestMapping(value = "getComments.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String getCommentsController(String post_seq) throws JsonProcessingException {
		List<CommentsVO> list = indexServiceImpl.getComments(Integer.parseInt(post_seq));
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;		
	}
	@RequestMapping(value = "belike.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String beLikeController(PostLikeVO vo) {
		indexServiceImpl.beLike(vo);
		return"";
	}
	@RequestMapping(value = "unlike.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String unLikeController(PostLikeVO vo) {
		indexServiceImpl.unLike(vo);
		return"";
	}
	@RequestMapping(value = "save.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String saveController(PostSaveVO vo) {
		indexServiceImpl.save(vo);
		return "";
	}
	@RequestMapping(value = "unsave.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String unsaveController(PostSaveVO vo) {
		indexServiceImpl.unsave(vo);
		return "";
	}
	@RequestMapping("specpost.do")
	public ModelAndView specpostController(@RequestParam("post_seq") String post_seq ,ModelAndView mav) {
		mav.addObject("post",indexServiceImpl.getSpecPost(Integer.parseInt(post_seq)));
		mav.addObject("comments",indexServiceImpl.getComments(Integer.parseInt(post_seq)));
		mav.setViewName("postpage");
		return mav;
	}
}	
