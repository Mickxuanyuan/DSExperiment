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
import com.hpu.fyx.model.SignIn;
import com.hpu.fyx.model.Task;
import com.hpu.fyx.model.User;

public class TeacherDaoImpl extends SqlSessionDaoSupport implements TeacherDao {
	private static final String CLASS_NAME = Question.class.getName();
	private static final String CLASS_NAME_Major = Major.class.getName();
	private static final String CLASS_NAME_User = User.class.getName();
	private static final String CLASS_NAME_Task = Task.class.getName();
	private static final String CLASS_NAME_SignIn = SignIn.class.getName();
	
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

	@Override
	public void deleteTask(String[] taskIds) {
		try {
			for (String id : taskIds) {
				int taskId = Integer.parseInt(id);
				getSqlSession().delete(CLASS_NAME_Task + ".deleteTaskDetail", taskId);
				getSqlSession().delete(CLASS_NAME_Task + ".deleteTask", taskId);
			}
		} catch (Exception e) {
			System.out.println("有个异常在这哈哈哈哈");
			e.printStackTrace();
		}
	}

	@Override
	public List<Task> queryEditTask(int taskId) {
		return getSqlSession().selectList(CLASS_NAME_Task + ".queryEditTask", taskId);
	}

	@Override
	public void updateTask(Task task) {
		getSqlSession().insert(CLASS_NAME_Task + ".updateTask", task);
		int taskId = task.getTaskId();
		int majorId = task.getMajorId();
		List<User> list = new ArrayList<User>();
		list = getSqlSession().selectList(CLASS_NAME_User + ".getStudentIdsByMajorId", majorId);
		String[] questionIds = task.getQuestionIds();
		for (User student : list) {
			for (String questionId : questionIds) {
				Map<String, Object> params = new HashMap<String, Object>();
		        params.put("taskId", taskId);
		        params.put("questionId", questionId);
		        int studentId = student.getId();
		        params.put("studentId", studentId);
		        getSqlSession().selectList(CLASS_NAME_Task + ".addTaskDetail", params);
			}
		}
	}

	@Override
	public List<SignIn> querySignInList(int userId) {
		List<SignIn> signInList = new ArrayList<SignIn>();
		List<Major> majorList = getSqlSession().selectList(CLASS_NAME_Major + ".getMajorList", userId);
		for (Major major : majorList) {
			int majorId = major.getId();
			int studentNumber = getSqlSession().selectOne(CLASS_NAME_User + ".getStudentNumbers", majorId);
			String majorName = getSqlSession().selectOne(CLASS_NAME_Major + ".getMajorName", majorId);
			List<Task> list = getSqlSession().selectList(CLASS_NAME_Task + ".queryBaseTask", majorId);
			for (Task task : list) {
				SignIn signIn = new SignIn();
				signIn.setSignNumber(studentNumber);
				signIn.setTaskId(task.getTaskId());
				String taskDate = task.getDate();
				signIn.setDate(taskDate);
				signIn.setMajor(majorName);
				Map<String, Object> params = new HashMap<String, Object>();
		        params.put("majorId", majorId);
		        params.put("taskDate", taskDate);
				int unSignNumber = getSqlSession().selectOne(CLASS_NAME_User + ".getUnSignNumbers", params);
				signIn.setUnSignNumber(unSignNumber);
				signInList.add(signIn);
			}
		}
		return signInList;
	}

	@Override
	public List<SignIn> getSignUpload(String majorName, String date) {
		Map<String, Object> params = new HashMap<String, Object>();
        params.put("majorName", majorName);
        params.put("taskDate", date);
        return getSqlSession().selectList(CLASS_NAME_SignIn + ".getSignUpload", params);
	}

	@Override
	public List<SignIn> signInDetail(String majorName, String date) {
		int majorId = getSqlSession().selectOne(CLASS_NAME_Major + ".getMajorId", majorName);
		Map<String, Object> params = new HashMap<String, Object>();
        params.put("majorId", majorId);
        params.put("taskDate", date);
		return getSqlSession().selectList(CLASS_NAME_SignIn + ".getSignUpload", params);
	}

	@Override
	public List<User> signInTotal(int majorId, String startDate, String endDate) {
		List<User> studentList = getSqlSession().selectList(CLASS_NAME_User + ".getStudenListByMajorId", majorId);
		List<User> userList = new ArrayList<User>();
		for (User user : studentList) {
			Map<String, Object> params = new HashMap<String, Object>();
	        params.put("userId", user.getId());
	        params.put("majorId", majorId);
	        params.put("startDate", startDate);
	        params.put("endDate", endDate);
			int signTotal = getSqlSession().selectOne(CLASS_NAME_Task + ".getSignTotal", params);
			int hadSignTotal = getSqlSession().selectOne(CLASS_NAME_Task + ".getHadSign", params);
			int hadUpload = getSqlSession().selectOne(CLASS_NAME_Task + ".getHadUpload", params);
			int hadNotSignTotal = signTotal - hadSignTotal;
			int hadNotUpload = signTotal - hadUpload;
			user.setHadNotSignTotal(hadNotSignTotal);
			user.setHadNotUpload(hadNotUpload);
			user.setSignTotal(hadSignTotal);
			userList.add(user);
		}
		return userList;
	}
}
