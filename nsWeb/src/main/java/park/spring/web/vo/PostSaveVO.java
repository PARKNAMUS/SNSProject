package park.spring.web.vo;

public class PostSaveVO {
	private int postsave_seq;
	private int postsave_post_seq;
	private String postsave_email;
	private String postsave_regdate;
	public int getPostsave_seq() {
		return postsave_seq;
	}
	public void setPostsave_seq(int postsave_seq) {
		this.postsave_seq = postsave_seq;
	}
	public int getPostsave_post_seq() {
		return postsave_post_seq;
	}
	public void setPostsave_post_seq(int postsave_post_seq) {
		this.postsave_post_seq = postsave_post_seq;
	}

	public String getPostsave_email() {
		return postsave_email;
	}
	public void setPostsave_email(String postsave_email) {
		this.postsave_email = postsave_email;
	}
	public String getPostsave_regdate() {
		return postsave_regdate;
	}
	public void setPostsave_regdate(String postsave_regdate) {
		this.postsave_regdate = postsave_regdate;
	}
	
}
