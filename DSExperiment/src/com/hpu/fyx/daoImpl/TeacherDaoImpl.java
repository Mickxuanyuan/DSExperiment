package com.hpu.fyx.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.hpu.fyx.dao.TeacherDao;
import com.hpu.fyx.model.Major;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;
import com.hpu.fyx.model.Task;
import com.hpu.fyx.model.User;

public class TeacherDaoImpl extends SqlSessionDaoSupport implements TeacherDao {
	private static final String CLASS_NAME = Question.class.getName();
	private static final String CLASS_NAME_Major = Major.class.getName();
	private static final String CLASS_NAME_User = User.class.getName();
	private static final String CLASS_NAME_Task = Task.class.getName();
	
	@Override
	public List<Question> queryQuestionList(Pagination pagination) {
		Map<String, Object> params = new HashMap<String, Object>();
        params.put("pageSize", pagination.getPageSize());
        params.put("startIndex", pagination.getStartIndex());
        params.put("searchContent", pagination.getSearchContent());
        params.put("chapterId", pagination.getChapterId());
        
        return getSqlSession().selectList(CLASS_NAME + ".queryQuestion", params);
	}

	@Override
	public int queryQuestionListCount(Pagination pagination) {
		Map<String, Object> params = new HashMap<String, Object>();
        params.put("searchContent", pagination.getSearchContent());
        params.put("chapterId", pagination.getChapterId());
        
        return getSqlSession().selectOne(CLASS_NAME + ".getQuestionCount", params);
	}

	@Override
	public Question updateQuestion(int questionId) {
		return getSqlSession().selectOne(CLASS_NAME + ".showAQuestion", questionId);
	}

	@Override
	public void editQuestion(Question question) {
		getSqlSession().update(CLASS_NAME + ".updateQuestion", question);
	}

	@Override
	public void deleteQuestion(String[] ids) {
		for (String id : ids) {
			int questionId = Integer.parseInt(id);
			getSqlSession().delete(CLASS_NAME + ".deleteQuestion", questionId);
		}
	}

	@Override
	public void addQuestion(Question question) {
		getSqlSession().insert(CLASS_NAME + ".addQuestion", question);
	}

	@Override
	public List<Major> getMajorList(int userId) {
		return getSqlSession().selectList(CLASS_NAME_Major + ".getMajorList", userId);
	}

	@Override
	public List<Question> getAllQuestionList(int chapterId) {
		return getSqlSession().selectList(CLASS_NAME + ".getAllQuestionList", chapterId);
	}
	
	@Override
	public void insertTask(Task task) {
		getSqlSession().insert(CLASS_NAME_Task + ".addTask", task);
		int increaseId = task.getTaskId();
		
		int majorId = task.getMajorId();
		List<User> list = new ArrayList<User>();
		list = getSqlSession().selectList(CLASS_NAME_User + ".getStudentIdsByMajorId", majorId);
		String[] questionIds = task.getQuestionIds();
		for (User student : list) {
			for (String questionId : questionIds) {
				Map<String, Object> params = new HashMap<String, Object>();
		        params.put("taskId", increaseId);
		        params.put("questionId", questionId);
		        int studentId = student.getId();
		        params.put("studentId", studentId);
		        getSqlSession().selectList(CLASS_NAME_Task + ".addTaskDetail", params);
			}
		}
	}

	@Override
	public List<Task> getTaskList() {
		return getSqlSession().selectList(CLASS_NAME_Task + ".getTaskList");
	}

	@Override
	public List<Question> getQuestionCount(int chapterId) {
		return getSqlSession().selectList(CLASS_NAME + ".queryQuestionCount", chapterId);
	}
}
