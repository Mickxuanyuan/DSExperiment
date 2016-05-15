package com.hpu.fyx.model;

public class SignIn {
	private int TaskId;
	private String major;
	private String date;
	private int signNumber;
	private int unSignNumber;
	private String signTime;
	private String uploadTime;
	private String studentId;
	private int signInStatus;
	private int uploadState;
	private String studentName;
	
	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public int getTaskId() {
		return TaskId;
	}
	
	public void setTaskId(int taskId) {
		TaskId = taskId;
	}
	
	public String getMajor() {
		return major;
	}
	
	public void setMajor(String major) {
		this.major = major;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public int getSignNumber() {
		return signNumber;
	}
	
	public void setSignNumber(int signNumber) {
		this.signNumber = signNumber;
	}
	
	public int getUnSignNumber() {
		return unSignNumber;
	}
	
	public void setUnSignNumber(int unSignNumber) {
		this.unSignNumber = unSignNumber;
	}
	
	public String getSignTime() {
		return signTime;
	}
	
	public void setSignTime(String signTime) {
		this.signTime = signTime;
	}
	
	public String getUploadTime() {
		return uploadTime;
	}
	
	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public int getSignInStatus() {
		return signInStatus;
	}

	public void setSignInStatus(int signInStatus) {
		this.signInStatus = signInStatus;
	}

	public int getUploadState() {
		return uploadState;
	}

	public void setUploadState(int uploadState) {
		this.uploadState = uploadState;
	}
}
