package park.spring.web.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import park.spring.web.service.message.MessageServiceImpl;
import park.spring.web.vo.MessageVO;


public class EchoHandler extends TextWebSocketHandler{
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, Object> users = new HashMap<String, Object>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("open:"+session.getId());
		sessionList.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		MessageVO client = objectMapper.readValue(message.getPayload(),MessageVO.class);
		if(client.getRegist().equals("y")) {
			users.put(client.getSenduser(), session);
		}else {
			WebSocketSession ws = (WebSocketSession)users.get(client.getGetuser());
			if(ws != null) {
				ws.sendMessage(new TextMessage(client.getMessage_content()));
			}
		}
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("close:"+session.getId());
		users.remove(session);
	}
}
