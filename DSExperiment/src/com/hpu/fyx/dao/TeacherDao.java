package com.hpu.fyx.dao;

import java.util.List;

import com.hpu.fyx.model.Major;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;

public interface TeacherDao {
	public List<Question> queryQuestionList(Pagination pagination);
	
	public int queryQuestionListCount(Pagination pagination);
	
	public Question updateQuestion(int questionId);
	
	public void editQuestion(Question question);
	
	public void deleteQuestion(String[] ids);
	
	public void addQuestion(Question question);
	
	public List<Major> getMajorList(int userId);
	
	public List<Question> getAllQuestionList(int chapterId);
}
