package com.entity;

public class UserPalacol {
	private String userName;
	private String password;
	private String email;
	private String activeTag;
	private String accessLevel;
	
	public UserPalacol(String userName, String password, String email, String activeTag, String accessLevel) {
		super();
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.activeTag = activeTag;
		this.accessLevel = accessLevel;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getActiveTag() {
		return activeTag;
	}
	public void setActiveTag(String activeTag) {
		this.activeTag = activeTag;
	}
	public String getAccessLevel() {
		return accessLevel;
	}
	public void setAccessLevel(String accessLevel) {
		this.accessLevel = accessLevel;
	}
}
