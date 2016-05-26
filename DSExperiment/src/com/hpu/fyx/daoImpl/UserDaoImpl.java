package com.hpu.fyx.daoImpl;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.hpu.fyx.dao.UserDao;
import com.hpu.fyx.model.User;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {
    private static final String CLASS_NAME = User.class.getName();
    private static final String SQL_ID_USER_GET_STUDENT_BY_ID = ".getStudentById";
    private static final String SQL_ID_USER_GET_TEACHER_BY_ID = ".getTeacherById";

    @Override
    public User getUserByName(String userId, String password, int inputUsernameStatus) {
    	 Map<String, Object> params = new HashMap<String, Object>();
         params.put("userId", userId);
         params.put("password", password);

    	if (inputUsernameStatus == 2) {
    		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_USER_GET_STUDENT_BY_ID, params);
    	}
    	else {
    		return getSqlSession().selectOne(CLASS_NAME + SQL_ID_USER_GET_TEACHER_BY_ID, params);
    	}
    }

	@Override
	public void updatePassword(String username, String password, String userRole) {
		 Map<String, Object> params = new HashMap<String, Object>();
         params.put("userId", username);
         params.put("password", password);
         params.put("userRole", userRole);
         if ("teacher".equals(userRole)) {
        	 getSqlSession().selectOne(CLASS_NAME + ".updatePassword", params);
         } else {
        	 getSqlSession().selectOne(CLASS_NAME + ".updatePasswordS", params);
         }
	}
}
