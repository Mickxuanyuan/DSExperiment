package com.hpu.fyx.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.hpu.fyx.dao.StudentDao;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;

public class StudentDaoImpl extends SqlSessionDaoSupport implements StudentDao {
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
}
