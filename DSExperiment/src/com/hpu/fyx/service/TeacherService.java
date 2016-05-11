package com.hpu.fyx.service;

import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;

public interface TeacherService {
	public Pagination searchQuestionList(Pagination pagination);
	
	public Question updateQuestion(int questionId);
	
	public void editQuestion(Question question);
	
	public void deleteQuestion(String[] ids);
}
