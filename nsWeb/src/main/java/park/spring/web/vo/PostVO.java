package park.spring.web.vo;

public class PostVO {
	
	private int post_seq;
	private String post_content;
	private String post_image;
	private String [] imageList;
	private String post_uploader;
	private String uploader_nickname;
	private String post_regdate;
	private String profile_img;
	private String nick_name;
	private int comments_num;
	private int is_like;
	private int is_save;
	private int like_num;
	private int post_size;
	
	public int getPost_size() {
		return post_size;
	}
	public void setPost_size(int post_size) {
		this.post_size = post_size;
	}
	public int getIs_save() {
		return is_save;
	}
	public void setIs_save(int is_save) {
		this.is_save = is_save;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public int getIs_like() {
		return is_like;
	}
	public void setIs_like(int is_like) {
		this.is_like = is_like;
	}
	public int getComments_num() {
		return comments_num;
	}
	public void setComments_num(int comments_num) {
		this.comments_num = comments_num;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public int getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_image() {
		return post_image;
	}
	public void setPost_image(String post_image) {
		this.post_image = post_image;
	}
	public String[] getImageList() {
		return imageList;
	}
	public void setImageList(String[] imageList) {
		this.imageList = imageList;
	}
	public String getPost_uploader() {
		return post_uploader;
	}
	public void setPost_uploader(String post_uploader) {
		this.post_uploader = post_uploader;
	}
	public String getUploader_nickname() {
		return uploader_nickname;
	}
	public void setUploader_nickname(String uploader_nickname) {
		this.uploader_nickname = uploader_nickname;
	}
	public String getPost_regdate() {
		return post_regdate;
	}
	public void setPost_regdate(String post_regdate) {
		this.post_regdate = post_regdate;
	}
	
}
