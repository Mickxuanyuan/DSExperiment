package com.hpu.fyx.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.hpu.fyx.dao.TeacherDao;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;

public class TeacherDaoImpl extends SqlSessionDaoSupport implements TeacherDao {
	private static final String CLASS_NAME = Question.class.getName();
	
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
}
