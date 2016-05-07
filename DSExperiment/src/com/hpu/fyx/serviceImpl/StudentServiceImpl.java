package com.hpu.fyx.serviceImpl;

import com.hpu.fyx.dao.StudentDao;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.service.StudentService;

public class StudentServiceImpl implements StudentService {
	private StudentDao studentDao;
	
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	@Override
	public Pagination searchQuestionList(Pagination pagination) {
		int totalRecord = studentDao.queryQuestionListCount(pagination);
		
		Pagination newPagination = new Pagination(pagination.getCurrentPage(), totalRecord, pagination.getPageSize());
		newPagination.setSearchContent(pagination.getSearchContent());
		newPagination.setChapterId(pagination.getChapterId());
		newPagination.setRecord(studentDao.queryQuestionList(newPagination));
		
		return newPagination;
	}
	
}
