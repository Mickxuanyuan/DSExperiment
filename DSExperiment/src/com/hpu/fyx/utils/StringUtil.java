package com.hpu.fyx.utils;

public class StringUtil {
    public static boolean isEmpty(String data) {
        if (data == null || data.equals("")) {
            return true;
        }
        return false;
    }
    
    public static int judgeUserNameAndPassword(String username) {
    	//默认username格式是错误的
    	int flag = 1;
    	if (username.matches("311[0-9]{9,9}")) {
    		//匹配这样的正则表示是学生登录
    		flag = 2;
    	}
    	else if (username.matches("422[0-9]{9,9}")) {
    		//匹配这样的正则表示是老师登录
    		flag = 3;  
    	}
    	
    	return flag;
    }
}
