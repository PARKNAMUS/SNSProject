package park.spring.web.service.message;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import park.spring.web.dao.message.MessageDAOImpl;
import park.spring.web.vo.MessageRoomVO;
import park.spring.web.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDAOImpl messageDAOImpl;

	@Override
	public List<MessageRoomVO> getMessageRoom(String email) {
		return messageDAOImpl.getMessageRoom(email);
	}

	@Override
	public void insertMessageRoom(MessageRoomVO vo) {
		if(messageDAOImpl.getRoomCheck(vo) == 0) {
			messageDAOImpl.insertMessageRoom(vo);
		}
	}

	@Override
	public List<MessageVO> getMessageForEmail(MessageRoomVO vo) {
		// TODO Auto-generated method stub
		return messageDAOImpl.getMessageForEmail(vo);
	}

	@Override
	public List<MessageVO> getMessage(int room_seq) {
		// TODO Auto-generated method stub
		return messageDAOImpl.getMessage(room_seq);
	}

	@Override
	public void insertMessage(MessageVO vo) {
		messageDAOImpl.insertMessage(vo);
		
	}

	@Override
	public int getRoomNum(Map<String, String> map) {
		// TODO Auto-generated method stub
		return messageDAOImpl.getRoomNum(map);
	}
}
