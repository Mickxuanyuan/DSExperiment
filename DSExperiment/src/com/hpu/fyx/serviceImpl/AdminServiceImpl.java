package com.hpu.fyx.serviceImpl;

import java.util.List;

import com.hpu.fyx.dao.AdminDao;
import com.hpu.fyx.model.Major;
import com.hpu.fyx.model.User;
import com.hpu.fyx.service.AdminService;

public class AdminServiceImpl implements AdminService {

    private AdminDao adminDao;
    
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public List<User> getTeacherList() {
		return adminDao.queryTeacherList();
	}

	@Override
	public List<Major> getMajorList() {
		return adminDao.queryMajorList();
	}

	@Override
	public List<User> getStudentList(int majorId) {
		return adminDao.queryStudentList(majorId);
	}

	@Override
	public void insertTeacher(User user) {
		adminDao.insertTeacherInfo(user);
	}

	@Override
	public User getTeacherInfoToEdit(int userId) {
		return adminDao.getTeacherInfoToEdit(userId);
	}

	@Override
	public void updateTeacher(User user) {
		adminDao.updateTeacherInfo(user);
	}

	@Override
	public void deleteTeacher(String[] ids) {
		adminDao.deleteTeacher(ids);
	}

	@Override
	public User getStudentInfoToEdit(int studentId) {
		return adminDao.getStudentInfoToEdit(studentId);
	}

	@Override
	public void updateStudent(User user) {
		adminDao.updateStudentInfo(user);
	}

	@Override
	public void insertStudent(User user) {
		adminDao.insertStudentInfo(user);
	}

	@Override
	public void deleteStudent(String[] ids) {
		adminDao.deleteStudent(ids);
	}

	@Override
	public void insertMajor(String majorName) {
		adminDao.insertMajorInfo(majorName);
	}

	@Override
	public void updateMajor(Major major) {
		adminDao.updateMajorInfo(major);
	}

	@Override
	public void deleteMajor(String[] ids) {
		adminDao.deleteMajor(ids);	
	}
}
