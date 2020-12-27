package com.vo;

public class Member {
	private String no;
	private String id;
	private String pw;
	private String email;
	private String lastName;
	private String firstName;
	private String nickname;
	private String address;
	private String phone;
	private String birthday;
	private String rdate;
	private String token;
	private String favorite;
	private String favoriteAddress;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFavorite() {
		return favorite;
	}

	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}

	public String getFavoriteAddress() {
		return favoriteAddress;
	}

	public void setFavoriteAddress(String favoriteAddress) {
		this.favoriteAddress = favoriteAddress;
	}

	@Override
	public String toString() {
		return "Member [no=" + no + ", id=" + id + ", pw=" + pw + ", email=" + email + ", lastName=" + lastName
				+ ", firstName=" + firstName + ", nickname=" + nickname + ", address=" + address + ", phone=" + phone
				+ ", birthday=" + birthday + ", rdate=" + rdate + ", token=" + token + ", favorite=" + favorite
				+ ", favoriteAddress=" + favoriteAddress + "]";
	}

}
