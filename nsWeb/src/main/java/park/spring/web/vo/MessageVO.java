package park.spring.web.vo;

public class MessageVO {
	
	private int message_seq;
	private String senduser;
	private String getuser;
	private String message_content;
	private String message_regdate;
	private String regist;
	private String message_time;
	private int message_room_seq;
	private String message_room_seqstr;
	
	public String getMessage_room_seqstr() {
		return message_room_seqstr;
	}
	public void setMessage_room_seqstr(String message_room_seqstr) {
		this.message_room_seqstr = message_room_seqstr;
	}
	public String getMessage_time() {
		return message_time;
	}
	public void setMessage_time(String message_time) {
		this.message_time = message_time;
	}
	public int getMessage_room_seq() {
		return message_room_seq;
	}
	public void setMessage_room_seq(int message_room_seq) {
		this.message_room_seq = message_room_seq;
	}
	public String getRegist() {
		return regist;
	}
	public void setRegist(String regist) {
		this.regist = regist;
	}
	public int getMessage_seq() {
		return message_seq;
	}
	public void setMessage_seq(int message_seq) {
		this.message_seq = message_seq;
	}

	public String getSenduser() {
		return senduser;
	}
	public void setSenduser(String senduser) {
		this.senduser = senduser;
	}
	public String getGetuser() {
		return getuser;
	}
	public void setGetuser(String getuser) {
		this.getuser = getuser;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getMessage_regdate() {
		return message_regdate;
	}
	public void setMessage_regdate(String message_regdate) {
		this.message_regdate = message_regdate;
	}
	@Override
	public String toString() {
		return "MessageVO [message_seq=" + message_seq + ", senduser=" + senduser + ", getuser=" + getuser
				+ ", message_content=" + message_content + ", message_regdate=" + message_regdate + ", regist=" + regist
				+ ", message_time=" + message_time + ", message_room_seq=" + message_room_seq + "]";
	}
	
	
}
