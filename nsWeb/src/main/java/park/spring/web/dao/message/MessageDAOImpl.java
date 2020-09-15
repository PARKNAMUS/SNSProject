package park.spring.web.dao.message;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import park.spring.web.vo.MessageRoomVO;
import park.spring.web.vo.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; 
	private String mbId = "MessageDAO.";
	@Override
	public List<MessageRoomVO> getMessageRoom(String email) {
		return sqlSessionTemplate.selectList(mbId+"getMessageRoom",email);
	}
	@Override
	public int getRoomCheck(MessageRoomVO vo) {
		return sqlSessionTemplate.selectOne(mbId+"getRoomCheck",vo);
	}
	@Override
	public void insertMessageRoom(MessageRoomVO vo) {
		sqlSessionTemplate.insert(mbId+"insertMessageRoom",vo);
	}
	@Override
	public List<MessageVO> getMessageForEmail(MessageRoomVO vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(mbId+"getMessageForEmail",vo);
	}
	@Override
	public List<MessageVO> getMessage(int room_seq) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList(mbId+"getMessage",room_seq);
	}
	@Override
	public void insertMessage(MessageVO vo) {
		sqlSessionTemplate.insert(mbId+"insertMessage",vo);
	}
	@Override
	public int getRoomNum(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(mbId+"getRoomNum",map);
	}
	
	
}
