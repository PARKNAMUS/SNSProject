package park.spring.web.vo;

public class CommentsVO {
	private int comments_seq;
	private String comments_email;
	private String comments_nick_name;
	private int commnets_post_seq;
	private String comments_regdate;
	public int getComments_seq() {
		return comments_seq;
	}
	public void setComments_seq(int comments_seq) {
		this.comments_seq = comments_seq;
	}
	public String getComments_email() {
		return comments_email;
	}
	public void setComments_email(String comments_email) {
		this.comments_email = comments_email;
	}
	public String getComments_nick_name() {
		return comments_nick_name;
	}
	public void setComments_nick_name(String comments_nick_name) {
		this.comments_nick_name = comments_nick_name;
	}
	public int getCommnets_post_seq() {
		return commnets_post_seq;
	}
	public void setCommnets_post_seq(int commnets_post_seq) {
		this.commnets_post_seq = commnets_post_seq;
	}
	public String getComments_regdate() {
		return comments_regdate;
	}
	public void setComments_regdate(String comments_regdate) {
		this.comments_regdate = comments_regdate;
	}
	
}
