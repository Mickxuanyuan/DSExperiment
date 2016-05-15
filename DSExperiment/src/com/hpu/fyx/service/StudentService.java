package com.hpu.fyx.service;

import java.util.List;

import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;

public interface StudentService {
	public Pagination searchQuestionList(Pagination pagination);
	
	public List<Question> queryDailyTask(int userId);
	
	public int querySignIn(int userId);
	
	public void insertSignIn(int userId);
	
	public void insertUploadInfo(int userId);
}
