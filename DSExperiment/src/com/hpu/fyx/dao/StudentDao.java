package com.hpu.fyx.dao;

import java.util.List;

import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;

public interface StudentDao {
	public List<Question> query(Pagination pagination);
}
