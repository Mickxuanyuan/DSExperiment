package com.hpu.fyx.utils;

import java.util.ArrayList;
import java.util.Random;

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
    
    public static String[] randomCommon(ArrayList<Integer> arraylist, int n){  
    	 String[] newArray = new String[n];
     
         //提取一个从数组中移除一个,效率最好
         for (int i = 0; i < n; i++)
         {
             Random rnd = new Random();
             int Id = rnd.nextInt(arraylist.size());
             newArray[i] = arraylist.get(Id).toString();
             arraylist.remove(Id);
         }
         return newArray;
    } 
    
}
