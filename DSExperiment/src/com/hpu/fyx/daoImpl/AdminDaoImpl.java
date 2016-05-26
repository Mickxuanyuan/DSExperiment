package com.hpu.fyx.daoImpl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.hpu.fyx.dao.AdminDao;
import com.hpu.fyx.model.User;

public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDao {
	private static final String CLASS_NAME_User = User.class.getName();
	
	@Override
	public List<User> queryTeacherList() {
		return getSqlSession().selectList(CLASS_NAME_User + ".getTeacherList");
	}

}
