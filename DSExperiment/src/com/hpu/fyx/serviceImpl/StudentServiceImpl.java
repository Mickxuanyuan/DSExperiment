package com.hpu.fyx.serviceImpl;

import java.util.List;

import com.hpu.fyx.dao.StudentDao;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;
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

	@Override
	public List<Question> queryDailyTask(int userId) {
		return studentDao.queryDailyTask(userId);
	}

	@Override
	public int querySignIn(int userId) {
		return studentDao.querySignIn(userId);
	}

	@Override
	public void insertSignIn(int userId) {
		studentDao.insertSignIn(userId);
	}

	@Override
	public void insertUploadInfo(int userId) {
		int signInfo = studentDao.querySignIn(userId);
		if (signInfo == 1) {
			//update
			studentDao.updateSignUpload(userId);
		} else {
			//insert
			studentDao.insertSignUpload(userId);
		}
	}
}
