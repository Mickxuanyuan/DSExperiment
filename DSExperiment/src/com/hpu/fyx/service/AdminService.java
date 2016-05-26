package com.hpu.fyx.service;

import java.util.List;

import com.hpu.fyx.model.Major;
import com.hpu.fyx.model.User;

public interface AdminService {
	public List<User> getTeacherList();

	public List<Major> getMajorList();
}
