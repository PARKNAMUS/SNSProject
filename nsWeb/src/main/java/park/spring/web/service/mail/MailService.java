package park.spring.web.service.mail;

import park.spring.web.vo.CustomerVO;

public interface MailService {
	
	public int send(String subject, String text, String from, String to, String filePath);
	
}
