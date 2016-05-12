package com.hpu.fyx.model;

public class Task {
	private String date;
	private int addState;
	private int majorId;
	private String[] questionIds;
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public int getAddState() {
		return addState;
	}
	
	public void setAddState(int addState) {
		this.addState = addState;
	}
	
	public int getMajorId() {
		return majorId;
	}
	
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}
	
	public String[] getQuestionIds() {
		return questionIds;
	}
	
	public void setQuestionIds(String[] questionIds) {
		this.questionIds = questionIds;
	}
}
