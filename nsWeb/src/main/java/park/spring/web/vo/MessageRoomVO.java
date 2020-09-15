package park.spring.web.vo;

public class MessageRoomVO {
	
	private int room_seq;
	private String room_user;
	private String room_user1;
	private String room_user2;
	private String user_nick_name;
	private String user_img;
	private String message;
	private String room_sysdate;
	
	public String getRoom_user1() {
		return room_user1;
	}
	public void setRoom_user1(String room_user1) {
		this.room_user1 = room_user1;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getRoom_user2() {
		return room_user2;
	}
	public void setRoom_user2(String room_user2) {
		this.room_user2 = room_user2;
	}
	public int getRoom_seq() {
		return room_seq;
	}
	public void setRoom_seq(int room_seq) {
		this.room_seq = room_seq;
	}

	public String getRoom_user() {
		return room_user;
	}
	public void setRoom_user(String room_user) {
		this.room_user = room_user;
	}
	public String getUser_nick_name() {
		return user_nick_name;
	}
	public void setUser_nick_name(String user_nick_name) {
		this.user_nick_name = user_nick_name;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public String getRoom_sysdate() {
		return room_sysdate;
	}
	public void setRoom_sysdate(String room_sysdate) {
		this.room_sysdate = room_sysdate;
	}
	
}
