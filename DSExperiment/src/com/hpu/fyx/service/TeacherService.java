package com.hpu.fyx.service;

import java.util.List;

import com.hpu.fyx.model.Major;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;
import com.hpu.fyx.model.Task;

public interface TeacherService {
	public Pagination searchQuestionList(Pagination pagination);
	
	public Question updateQuestion(int questionId);
	
	public void editQuestion(Question question);
	
	public void deleteQuestion(String[] ids);
	
	public void addQuestion(Question question);
	
	public List<Major> getMajorList(int userId);
	
	public List<Question> getAllQuestion(int chapterId);
	
	public List<Task> getTaskList();
	
	public void insertTask(Task task);
	
	public void insertRandomTask(Task task, int chapterId, int questionNumber);
}
