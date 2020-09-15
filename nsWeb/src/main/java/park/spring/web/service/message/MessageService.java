package park.spring.web.service.message;

import java.util.List;
import java.util.Map;

import park.spring.web.vo.MessageRoomVO;
import park.spring.web.vo.MessageVO;

public interface MessageService {
	public List<MessageRoomVO> getMessageRoom(String email);
	public void insertMessageRoom(MessageRoomVO vo);
	public List<MessageVO> getMessageForEmail(MessageRoomVO vo);
	public List<MessageVO> getMessage(int room_seq);
	public void insertMessage(MessageVO vo);
	public int getRoomNum(Map<String, String> map);
}
