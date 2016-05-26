package com.hpu.fyx.serviceImpl;

import com.hpu.fyx.dao.UserDao;
import com.hpu.fyx.exception.ParameterException;
import com.hpu.fyx.exception.ServiceException;
import com.hpu.fyx.model.User;
import com.hpu.fyx.service.UserService;
import com.hpu.fyx.utils.StringUtil;

public class UserServiceImpl implements UserService {

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User login(String userId, String password) throws ParameterException, ServiceException {
    	User user = null;
	
        ParameterException parameterException = new ParameterException();

        if (StringUtil.isEmpty(userId)) {
            parameterException.addErrorField("userName", "请输入学工号");
        }
        
        if (StringUtil.isEmpty(password)) {
            parameterException.addErrorField("password", "请输入密码");
        }
        
        if (parameterException.isErrorField()) {
            throw parameterException;
        }

        int inputUsernameStatus = StringUtil.judgeUserNameAndPassword(userId);
        
        if (inputUsernameStatus == 1) {
        	throw new ServiceException(1000, "学工号格式不存在");
        } else {
        	user = userDao.getUserByName(userId, password, inputUsernameStatus);
        }

        if (user == null) {
            throw new ServiceException(1001, "学工号或密码不正确");
        }

        user.setUserRole(inputUsernameStatus);
        return user;
    }

	@Override
	public void updatePassword(String username, String password, String userRole) {
		userDao.updatePassword(username, password, userRole);
	}
}
