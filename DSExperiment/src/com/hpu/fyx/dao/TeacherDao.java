package com.hpu.fyx.dao;

import java.util.List;

import com.hpu.fyx.model.Major;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;
import com.hpu.fyx.model.SignIn;
import com.hpu.fyx.model.Task;
import com.hpu.fyx.model.User;

public interface TeacherDao {
	public List<Question> queryQuestionList(Pagination pagination);
	
	public int queryQuestionListCount(Pagination pagination);
	
	public Question updateQuestion(int questionId);
	
	public void editQuestion(Question question);
	
	public void deleteQuestion(String[] ids);
	
	public void addQuestion(Question question);
	
	public List<Major> getMajorList(int userId);
	
	public List<Question> getAllQuestionList(int chapterId);
	
	public void insertTask(Task task);
	
	public List<Task> getTaskList();
	
	public List<Question> getQuestionCount(int chapterId);
	
	public void deleteTask(String[] taskIds);
	
	public List<Task> queryEditTask(int taskId);
	
	public void updateTask(Task task);
	
	public List<SignIn> querySignInList(int userId);
	
	public List<SignIn> getSignUpload(String majorName, String date);
	
	public List<SignIn> signInDetail(String majorName, String date);
	
	public List<User> signInTotal(int majorId, String startDate, String endDate);
}
