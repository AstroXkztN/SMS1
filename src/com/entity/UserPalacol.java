package com.entity;

public class UserPalacol {
	private String userName;
	private String password;
	private String first_name;
	private String last_name;
	private String middle_initial;
	private String email;
	private String activeTag;
	private String accessLevel;
	private String entry_date;
	
	public UserPalacol(String userName, String password, String first_name, String last_name, String middle_initial,
			String email, String activeTag, String accessLevel, String entry_date) {
		super();
		this.userName = userName;
		this.password = password;
		this.first_name = first_name;
		this.last_name = last_name;
		this.middle_initial = middle_initial;
		this.email = email;
		this.activeTag = activeTag;
		this.accessLevel = accessLevel;
		this.entry_date = entry_date;
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
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getMiddle_initial() {
		return middle_initial;
	}
	public void setMiddle_initial(String middle_initial) {
		this.middle_initial = middle_initial;
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
	public String getEntry_date() {
		return entry_date;
	}
	public void setEntry_date(String entry_date) {
		this.entry_date = entry_date;
	}
	
	
}
