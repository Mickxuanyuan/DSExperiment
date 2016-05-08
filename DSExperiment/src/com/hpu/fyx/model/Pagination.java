package com.hpu.fyx.model;

import java.util.List;

public class Pagination {
	private List<?> record;//存储页面数据
	
	private int currentPage = 1;//当前页面
	private int totalRecord;//总记录数
	private int pageSize = 10;//每页的显示行数
	private int totalPage;//总的页数
	private int startIndex;//每页开始的索引
	private String searchContent;//搜索的内容
	private int chapterId;
	
	public Pagination() {
		
	}
	public Pagination(int currentPage, int totalRecord, int pageSize) {
		this.currentPage = currentPage;
		this.totalRecord = totalRecord;
		this.pageSize = pageSize;
		
		totalPage = (totalRecord % pageSize == 0) ? (totalRecord / pageSize) : (totalRecord / pageSize + 1);
		if (totalPage == 0) {
			totalPage = 1;
		}
		startIndex = (currentPage-1) * pageSize;
	}
	
	public List<?> getRecord() {
		return record;
	}
	
	public void setRecord(List<?> record) {
		this.record = record;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getTotalRecord() {
		return totalRecord;
	}
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getStartIndex() {
		return startIndex;
	}
	
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	
	public int getChapterId() {
		return chapterId;
	}
	
	public void setChapterId(int chapterId) {
		this.chapterId = chapterId;
	}
}
