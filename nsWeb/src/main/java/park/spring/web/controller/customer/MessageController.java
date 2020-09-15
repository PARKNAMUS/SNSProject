package park.spring.web.controller.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import park.spring.web.service.customer.CustomerServiceImpl;
import park.spring.web.service.message.MessageServiceImpl;
import park.spring.web.vo.MessageRoomVO;
import park.spring.web.vo.MessageVO;

@Controller
public class MessageController {
	
	@Autowired
	private MessageServiceImpl messageServiceImpl;
	@Autowired
	private CustomerServiceImpl customerServiceImpl;
	
	@RequestMapping("chatlist.do")
	public ModelAndView chatlistController(@RequestParam("email") String email,ModelAndView mav) {
		mav.addObject("room",messageServiceImpl.getMessageRoom(email));
		mav.setViewName("chatmember");
		return mav;
	}
	@RequestMapping("messageRoom.do")
	public ModelAndView messageRoomController(MessageRoomVO vo, ModelAndView mav) {
		messageServiceImpl.insertMessageRoom(vo);
		mav.addObject("user",customerServiceImpl.getCustomer(vo.getRoom_user2()));
		Map<String, String> map = new HashMap<String, String>();
		map.put("room_user", vo.getRoom_user());
		map.put("room_user2", vo.getRoom_user2());
		mav.addObject("roomNum", messageServiceImpl.getRoomNum(map));
		List<MessageVO> list = messageServiceImpl.getMessageForEmail(vo);
		if(list.size() >0) {
			mav.addObject("message",list);
		}
		mav.setViewName("messageRoom");
		return mav;
	}
	@RequestMapping("messageRoomForNum.do")
	public ModelAndView messageRoomController2(MessageRoomVO vo, ModelAndView mav) {
		mav.addObject("user",customerServiceImpl.getCustomer(vo.getRoom_user2()));
		Map<String, String> map = new HashMap<String, String>();
		map.put("room_user", vo.getRoom_user());
		map.put("room_user2", vo.getRoom_user2());
		mav.addObject("roomNum", messageServiceImpl.getRoomNum(map));
		List<MessageVO> list = messageServiceImpl.getMessage(vo.getRoom_seq());
		if(list.size() >0) {
			mav.addObject("message",list);
		}
		mav.setViewName("messageRoom");
		return mav;
	}
	@RequestMapping(value = "addMessage.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertMessageController(MessageVO vo) {
		System.out.println(vo.toString());
		messageServiceImpl.insertMessage(vo);
		return "";
	}
}
