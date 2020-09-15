package park.spring.web.vo;

public class PostLikeVO {
	
	private int postlike_seq;
	private int postlike_post_seq;
	private int sum_post_like;
	private String postlike_email;
	public int getPostlike_seq() {
		return postlike_seq;
	}
	public void setPostlike_seq(int postlike_seq) {
		this.postlike_seq = postlike_seq;
	}
	public int getPostlike_post_seq() {
		return postlike_post_seq;
	}
	public void setPostlike_post_seq(int postlike_post_seq) {
		this.postlike_post_seq = postlike_post_seq;
	}
	public int getSum_post_like() {
		return sum_post_like;
	}
	public void setSum_post_like(int sum_post_like) {
		this.sum_post_like = sum_post_like;
	}
	public String getPostlike_email() {
		return postlike_email;
	}
	public void setPostlike_email(String postlike_email) {
		this.postlike_email = postlike_email;
	}
	
}
