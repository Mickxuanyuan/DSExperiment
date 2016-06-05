package com.hpu.fyx.dao;

import java.util.List;

import com.hpu.fyx.model.Major;
import com.hpu.fyx.model.User;

public interface AdminDao {
	public List<User> queryTeacherList();
	
	public List<Major> queryMajorList();

	public List<User> queryStudentList(int majorId);

	public void insertTeacherInfo(User user);
	
	public User getTeacherInfoToEdit(int userId);
	
	public void updateTeacherInfo(User user);
	
	public void deleteTeacher(String[] ids);
	
	public User getStudentInfoToEdit(int userId);

	public void updateStudentInfo(User user);

	public void insertStudentInfo(User user);

	public void deleteStudent(String[] ids);

	public void insertMajorInfo(String majorName);

	public void updateMajorInfo(Major major);

	public void deleteMajor(String[] ids);
}
