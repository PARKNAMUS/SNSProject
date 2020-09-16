package park.spring.web.vo;

public class BlameVO {
	
	private int blame_seq;
	private String blame_email;
	private int blame_content_seq;
	private String blame_regdate;
	private String blame_description;
	private String blame_target_email;
	public int getBlame_seq() {
		return blame_seq;
	}
	public void setBlame_seq(int blame_seq) {
		this.blame_seq = blame_seq;
	}
	public String getBlame_email() {
		return blame_email;
	}
	public void setBlame_email(String blame_email) {
		this.blame_email = blame_email;
	}
	public int getBlame_content_seq() {
		return blame_content_seq;
	}
	public void setBlame_content_seq(int blame_content_seq) {
		this.blame_content_seq = blame_content_seq;
	}
	public String getBlame_regdate() {
		return blame_regdate;
	}
	public void setBlame_regdate(String blame_regdate) {
		this.blame_regdate = blame_regdate;
	}
	public String getBlame_description() {
		return blame_description;
	}
	public void setBlame_description(String blame_description) {
		this.blame_description = blame_description;
	}
	public String getBlame_target_email() {
		return blame_target_email;
	}
	public void setBlame_target_email(String blame_target_email) {
		this.blame_target_email = blame_target_email;
	}
	
}
