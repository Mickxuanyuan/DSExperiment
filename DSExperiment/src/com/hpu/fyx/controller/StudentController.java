package com.hpu.fyx.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hpu.fyx.common.Constants;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.User;
import com.hpu.fyx.service.StudentService;

@Controller
@RequestMapping(Constants.APP_URL_STUDENT_PREFIX)
public class StudentController extends BaseController{
	private static final String QUESTION_LIST_JSP = "student/student_question_list";
	
	@Autowired
    private StudentService studentService;

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	 @RequestMapping(value = "/questionList", method = RequestMethod.GET)
	    public ModelAndView mybook(
	                               @RequestParam(value = "searchContent", defaultValue = "") String searchContent,
	                               @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
	                               @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
	                               @RequestParam(value = "chapterId", defaultValue = "2") int chapterId
	                               ) {
	        User user = this.getUser();
	        Pagination pagination = new Pagination();
	        pagination.setCurrentPage(currentPage);
	        pagination.setSearchContent(searchContent);
	        pagination.setPageSize(pageSize);
	        pagination.setChapterId(chapterId);
	        ModelAndView modelAndView = new ModelAndView();

	        pagination = studentService.searchQuestionList(pagination);
	        modelAndView.addObject("pagination", pagination);
	        modelAndView.addObject("user", user);
	        modelAndView.setViewName(QUESTION_LIST_JSP);
	        
	        return modelAndView;
	    }
}
