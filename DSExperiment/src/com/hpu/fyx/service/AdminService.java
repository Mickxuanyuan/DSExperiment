package com.hpu.fyx.service;

import java.util.List;

import com.hpu.fyx.model.Major;
import com.hpu.fyx.model.User;

public interface AdminService {
	public List<User> getTeacherList();

	public List<Major> getMajorList();

	public List<User> getStudentList(int majorId);
	
	public void insertTeacher(User user);
	
	public User getTeacherInfoToEdit(int userId);

	public void updateTeacher(User user);

	public void deleteTeacher(String[] ids);

	public User getStudentInfoToEdit(int studentId);

	public void updateStudent(User user);

	public void insertStudent(User user);

	public void deleteStudent(String[] ids);

	public void insertMajor(String majorName);

	public void updateMajor(Major major);

	public void deleteMajor(String[] ids);
}
