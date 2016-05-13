package com.hpu.fyx.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.hpu.fyx.dao.TeacherDao;
import com.hpu.fyx.model.Major;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;
import com.hpu.fyx.model.Task;
import com.hpu.fyx.service.TeacherService;
import com.hpu.fyx.utils.StringUtil;

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

	@Override
	public void addQuestion(Question question) {
		teacherDao.addQuestion(question);
	}

	@Override
	public List<Major> getMajorList(int userId) {
		return teacherDao.getMajorList(userId);
	}

	@Override
	public List<Question> getAllQuestion(int chapterId) {
		return teacherDao.getAllQuestionList(chapterId);
	}

	@Override
	public List<Task> getTaskList() {
		return teacherDao.getTaskList();
	}

	@Override
	public void insertTask(Task task) {
		task.setAddState(1);
		teacherDao.insertTask(task);
	}

	@Override
	public void insertRandomTask(Task task, int chapterId, int questionNumber) {
		List<Question> listIds = teacherDao.getQuestionCount(chapterId);
		task.setAddState(2);
		ArrayList<Integer> array = new ArrayList<Integer>();
		for (int i = 0; i < listIds.size(); i++) {
			array.add(listIds.get(i).getId());
		}
		String[] questionIds = StringUtil.randomCommon(array, questionNumber);
		task.setQuestionIds(questionIds);
		teacherDao.insertTask(task);
	}
}
