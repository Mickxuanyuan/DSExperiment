package com.hpu.fyx.serviceImpl;

import com.hpu.fyx.dao.TeacherDao;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;
import com.hpu.fyx.service.TeacherService;

public class TeacherServiceImpl implements TeacherService {
	private TeacherDao teacherDao;

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	@Override
	public Pagination searchQuestionList(Pagination pagination) {
		int totalRecord = teacherDao.queryQuestionListCount(pagination);
		
		Pagination newPagination = new Pagination(pagination.getCurrentPage(), totalRecord, pagination.getPageSize());
		newPagination.setSearchContent(pagination.getSearchContent());
		newPagination.setChapterId(pagination.getChapterId());
		newPagination.setRecord(teacherDao.queryQuestionList(newPagination));
		
		return newPagination;
	}

	@Override
	public Question updateQuestion(int questionId) {
		return teacherDao.updateQuestion(questionId);
	}

	@Override
	public void editQuestion(Question question) {
		teacherDao.editQuestion(question);
	}

	@Override
	public void deleteQuestion(String[] ids) {
		teacherDao.deleteQuestion(ids);
	}
}
