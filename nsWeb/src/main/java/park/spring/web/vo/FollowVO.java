package park.spring.web.vo;

public class FollowVO {
	private int follow_seq;
	private String follower;//ÆÈ·Î¿ìÇÏ´Â »ç¶÷
	private String following;//ÆÈ·ÎÀ×µÇ´Â »ç¶÷
	private String follow_regdate;
	public int getFollow_seq() {
		return follow_seq;
	}
	public void setFollow_seq(int follow_seq) {
		this.follow_seq = follow_seq;
	}
	public String getFollower() {
		return follower;
	}
	public void setFollower(String follower) {
		this.follower = follower;
	}
	public String getFollowing() {
		return following;
	}
	public void setFollowing(String following) {
		this.following = following;
	}
	public String getFollow_regdate() {
		return follow_regdate;
	}
	public void setFollow_regdate(String follow_regdate) {
		this.follow_regdate = follow_regdate;
	}
	
}
