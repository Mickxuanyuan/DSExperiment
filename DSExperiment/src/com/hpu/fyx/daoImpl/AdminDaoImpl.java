package com.hpu.fyx.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.hpu.fyx.dao.AdminDao;
import com.hpu.fyx.model.Major;
import com.hpu.fyx.model.User;

public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDao {
	private static final String CLASS_NAME_User = User.class.getName();
	private static final String CLASS_NAME_Major = Major.class.getName();
	
	@Override
	public List<User> queryTeacherList() {
		return getSqlSession().selectList(CLASS_NAME_User + ".getTeacherList");
	}

	@Override
	public List<Major> queryMajorList() {
		return getSqlSession().selectList(CLASS_NAME_Major + ".getMajorAllList");
	}

	@Override
	public List<User> queryStudentList(int majorId) {
		return getSqlSession().selectList(CLASS_NAME_User + ".getStudentList", majorId);
	}
	
	@Override
	public void insertTeacherInfo(User user) {
		getSqlSession().insert(CLASS_NAME_User + ".addTeacher", user);
		int teacherId = user.getId();
		int[] majorIds = user.getMajorIds();
		for (int majorId : majorIds) {
			Map<String, Object> params = new HashMap<String, Object>();
	        params.put("majorId", majorId);
	        params.put("teacherId", teacherId);
	        getSqlSession().insert(CLASS_NAME_User + ".addTeacherMajor", params);
		}
	}

	@Override
	public User getTeacherInfoToEdit(int userId) {
		User user = new User();
		List<User> listUser = getSqlSession().selectList(CLASS_NAME_User + ".getTeacherOnlyById", userId);
		user = listUser.get(0);
		List<Major> list = getSqlSession().selectList(CLASS_NAME_Major + ".getMajorIdsByTeacherId", userId);
		int[] majorIds = new int[list.size()];
		for (int i = 0; i<list.size(); i++) {
			majorIds[i] = list.get(i).getId();
		}
		user.setMajorIds(majorIds);
		return user;
	}

	@Override
	public void updateTeacherInfo(User user) {
		getSqlSession().update(CLASS_NAME_User + ".updateTeacherinfo", user);
		int[] majorIds = user.getMajorIds();
		getSqlSession().delete(CLASS_NAME_User + ".deleteTeacherMajor", user.getId());
		for (int i : majorIds) {
			Map<String, Object> params = new HashMap<String, Object>();
	        params.put("majorId", i);
	        params.put("teacherId", user.getId());
	        getSqlSession().insert(CLASS_NAME_User + ".addTeacherMajor", params);
		}
	}

	@Override
	public void deleteTeacher(String[] ids) {
		for (String string : ids) {
			int id = Integer.parseInt(string);
			getSqlSession().delete(CLASS_NAME_User + ".deleteTeacherMajor", id);
			getSqlSession().delete(CLASS_NAME_User + ".deleteTeacher", id);
		}
	}

	@Override
	public User getStudentInfoToEdit(int userId) {
		List<User> listUser = getSqlSession().selectList(CLASS_NAME_User + ".getStudentOnlyById", userId);
		return listUser.get(0);
	}

	@Override
	public void updateStudentInfo(User user) {
		getSqlSession().update(CLASS_NAME_User + ".updateStudentinfo", user);
	}

	@Override
	public void insertStudentInfo(User user) {
		getSqlSession().insert(CLASS_NAME_User + ".addStudent", user);
	}

	@Override
	public void deleteStudent(String[] ids) {
		for (String string : ids) {
			int id = Integer.parseInt(string);
			getSqlSession().delete(CLASS_NAME_User + ".deleteStudent", id);
		}
	}

	@Override
	public void insertMajorInfo(String majorName) {
		getSqlSession().insert(CLASS_NAME_Major + ".addMajor", majorName);
	}

	@Override
	public void updateMajorInfo(Major major) {
		getSqlSession().update(CLASS_NAME_Major + ".updateMajor", major);
	}

	@Override
	public void deleteMajor(String[] ids) {
		for (String string : ids) {
			int id = Integer.parseInt(string);
			getSqlSession().delete(CLASS_NAME_Major + ".deleteMajor", id);
		}
	}
}
