package com.hpu.fyx.model;

public class Task {
	private int taskId;
	private String date;
	private int addState;
	private int majorId;
	private String majorName;
	private String[] questionIds;
	private int chapterId;
	private int questionId;
	
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

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public int getChapterId() {
		return chapterId;
	}

	public void setChapterId(int chapterId) {
		this.chapterId = chapterId;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
}
