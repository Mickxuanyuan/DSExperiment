package com.hpu.fyx.dao;

import com.hpu.fyx.model.User;


public interface UserDao {
    public User getUserByName(String userId, String password ,int inputUsernameStatus);
}
