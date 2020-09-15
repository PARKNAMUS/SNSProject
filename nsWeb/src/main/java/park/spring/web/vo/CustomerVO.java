package park.spring.web.vo;

import org.springframework.web.multipart.MultipartFile;

public class CustomerVO {
	private String email;
	private String password;
	private String name;
	private String nick_name;
	private String introduce;
	private String gender;
	private String phone;
	private int status;
	private int followStatus;
	private String profile_img;
	private MultipartFile uploadProfile;
	private String regdate;
	private int follow_num;
	private int following_num;
	

	public int getFollow_num() {
		return follow_num;
	}
	public void setFollow_num(int follow_num) {
		this.follow_num = follow_num;
	}
	public int getFollowing_num() {
		return following_num;
	}
	public void setFollowing_num(int following_num) {
		this.following_num = following_num;
	}
	public int getFollowStatus() {
		return followStatus;
	}
	public void setFollowStatus(int followStatus) {
		this.followStatus = followStatus;
	}
	public MultipartFile getUploadProfile() {
		return uploadProfile;
	}
	public void setUploadProfile(MultipartFile uploadProfile) {
		this.uploadProfile = uploadProfile;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	
}
