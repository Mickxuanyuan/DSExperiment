package com.hpu.fyx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hpu.fyx.common.Constants;
import com.hpu.fyx.model.Major;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;
import com.hpu.fyx.model.User;
import com.hpu.fyx.service.TeacherService;

@Controller
@RequestMapping(Constants.APP_URL_TEACHER_PREFIX)
public class TeacherController extends BaseController{
	private static final String QUESTION_LIST_JSP = "teacher/teacher_question_list";
	private static final String QUESTION_SHOW_JSP = "teacher/teacher_edit_question";
	private static final String QUESTION_LIST_PAGE = "teacher/questionList";
	private static final String QUESTION_DETAIL_JSP = "teacher/teacher_question_detail";
	private static final String QUESTION_ADD_JSP = "teacher/teacher_add_question";
	private static final String QUESTION_RELEASE_TASK_JSP = "teacher/teacher_release_task";
	
	@Autowired
    private TeacherService teacherService;
	
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	@RequestMapping(value = "/questionList", method = RequestMethod.GET)
	    public ModelAndView myQuestion(
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

	        pagination = teacherService.searchQuestionList(pagination);
	        modelAndView.addObject("pagination", pagination);
	        modelAndView.addObject("user", user);
	        modelAndView.setViewName(QUESTION_LIST_JSP);
	        
	        return modelAndView;
	    }
	
	@RequestMapping(value = "/editQuestion", method = RequestMethod.GET)
    public ModelAndView myEditQuestion(
                               @RequestParam(value = "questionId", defaultValue = "1") int questionId
                               ) {
		User user = this.getUser();
        ModelAndView modelAndView = new ModelAndView();

        Question question = teacherService.updateQuestion(questionId);
        modelAndView.addObject("question", question);
        modelAndView.addObject("user", user);
        modelAndView.setViewName(QUESTION_SHOW_JSP);
        
        return modelAndView;
    }
	
	@RequestMapping(value = "/detailQuestion", method = RequestMethod.GET)
    public ModelAndView myDetailQuestion(
                               @RequestParam(value = "questionId", defaultValue = "1") int questionId
                               ) {
		User user = this.getUser();
        ModelAndView modelAndView = new ModelAndView();

        Question question = teacherService.updateQuestion(questionId);
        modelAndView.addObject("question", question);
        modelAndView.addObject("user", user);
        modelAndView.setViewName(QUESTION_DETAIL_JSP);
        
        return modelAndView;
    }
	
	@RequestMapping(value = "/submitEditResult", method = RequestMethod.POST)
    public ModelAndView submitEditResult(
    						   @RequestParam(value = "id", defaultValue = "1") int id,
                               @RequestParam(value = "options", defaultValue = "1") int option,
                               @RequestParam(value = "questionTitle", defaultValue = "") String questionTitle,
                               @RequestParam(value = "questionDescription", defaultValue = "") String questionDescription
                               ) {
        Question question = new Question();
        question.setId(id);
        question.setChapterId(option);
        question.setTitle(questionTitle);
        question.setDescription(questionDescription);
        ModelAndView modelAndView = new ModelAndView();
        teacherService.editQuestion(question);
        modelAndView.setView(this.getRedirectView(QUESTION_LIST_PAGE));
        
        return modelAndView;
    }
	
	@RequestMapping(value = "/deleteQuestion", method = RequestMethod.POST)
    public ModelAndView submitEditResult(
    						   @RequestParam(value = "chkAll", defaultValue = "1") String[] ids
    									) {
        ModelAndView modelAndView = new ModelAndView();
        teacherService.deleteQuestion(ids);
        modelAndView.setView(this.getRedirectView(QUESTION_LIST_PAGE));
        
        return modelAndView;
    }
	
	@RequestMapping(value = "/submitAddQuestion", method = RequestMethod.POST)
    public ModelAndView submitAddQuestion(
                               @RequestParam(value = "options", defaultValue = "1") int option,
                               @RequestParam(value = "questionTitle", defaultValue = "") String questionTitle,
                               @RequestParam(value = "questionDescription", defaultValue = "") String questionDescription
                               ) {
        Question question = new Question();
        question.setChapterId(option);
        question.setTitle(questionTitle);
        question.setDescription(questionDescription);
        ModelAndView modelAndView = new ModelAndView();
        teacherService.addQuestion(question);
        modelAndView.setView(this.getRedirectView(QUESTION_LIST_PAGE));
        
        return modelAndView;
    }
	
	@RequestMapping(value = "/addQuestion", method = RequestMethod.GET)
    public ModelAndView addQuestion() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(QUESTION_ADD_JSP);
        
        return modelAndView;
    }
	
	@RequestMapping(value = "/assignTask", method = RequestMethod.GET)
    public ModelAndView assignTask(
    							  @RequestParam(value = "chapterId", defaultValue = "2") int chapterId
    							  ) {
		User user = this.getUser();
        ModelAndView modelAndView = new ModelAndView();
        List<Major> majorList = teacherService.getMajorList(user.getId());
        List<Question> questionList = teacherService.getAllQuestion(chapterId);
        modelAndView.setViewName(QUESTION_RELEASE_TASK_JSP);
        modelAndView.addObject("user", user);
        modelAndView.addObject("majorList", majorList);
        modelAndView.addObject("questionList", questionList);
        return modelAndView;
    }
}
