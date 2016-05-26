package com.hpu.fyx.service;

import com.hpu.fyx.exception.ParameterException;
import com.hpu.fyx.exception.ServiceException;
import com.hpu.fyx.model.User;

public interface UserService {
    public User login(String userName, String password) throws ParameterException, ServiceException;
    
    public void updatePassword(String username, String password, String userRole);
}
