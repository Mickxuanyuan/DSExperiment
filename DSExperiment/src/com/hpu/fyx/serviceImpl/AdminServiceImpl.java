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
		// TODO Auto-generated method stub
		return null;
	}
}
