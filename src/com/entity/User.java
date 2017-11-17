package com.entity;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class User {
	
	private DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
	private String userID;
	private String password;
	private String firstName;
	private String lastName;
	private String middleInitial;
	private String emailAddress;
	private String activeTag;
	private String accessLevel;
	private String entryDate;
	private String lastLogin;
	private String lastUpdatedBy;
	private String lastUpdate;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
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
	public String getMiddleInitial() {
		return middleInitial;
	}
	public void setMiddleInitial(String middleInitial) {
		this.middleInitial = middleInitial;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
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
	public String getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(Date entryDate) {
		this.entryDate = dateFormat.format(entryDate);
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		if(lastLogin == null){
			this.lastLogin = null;
		}else{
			this.lastLogin = dateFormat.format(lastLogin);
		}
	}
	public String getLastUpdatedBy() {
		return lastUpdatedBy;
	}
	public void setLastUpdatedBy(String lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}
	public String getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = dateFormat.format(lastUpdate);
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
