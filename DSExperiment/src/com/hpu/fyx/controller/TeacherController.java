package com.hpu.fyx.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.hpu.fyx.model.SignIn;
import com.hpu.fyx.model.Task;
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
	private static final String QUESTION_TASK_LIST_JSP = "teacher/teacher_task_list";
	private static final String QUESTION_TASK_LIST_PAGE = "teacher/getTaskList";
	private static final String QUESTION_RANDOM_TASK_JSP = "teacher/teacher_random_task";
	private static final String QUESTION_EDIT_TASK_JSP = "teacher/teacher_edit_task";
	private static final String QUESTION_SIGN_IN_JSP = "teacher/teacher_sign_in_list";
	private static final String QUESTION_SIGN_IN_DETAIL_JSP = "teacher/teacher_sign_in_detail_list";
	
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
    public ModelAndView deleteQuestion(
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
	
	@RequestMapping(value = "/addTaskJsp", method = RequestMethod.GET)
    public ModelAndView assignTask(
    							  @RequestParam(value = "chapterId", defaultValue = "2") int chapterId,
    							  @RequestParam(value = "major", defaultValue = "0") int majorId,
    							  @RequestParam(value = "date", defaultValue = "2016-06-06") String date
    							  ) {
		User user = this.getUser();
        ModelAndView modelAndView = new ModelAndView();
        List<Major> majorList = teacherService.getMajorList(user.getId());
        List<Question> questionList = teacherService.getAllQuestion(chapterId);
        modelAndView.setViewName(QUESTION_RELEASE_TASK_JSP);
        modelAndView.addObject("user", user);
        modelAndView.addObject("majorList", majorList);
        modelAndView.addObject("questionList", questionList);
        modelAndView.addObject("chapterId", chapterId);
        modelAndView.addObject("major", majorId);
        modelAndView.addObject("date", date);
        return modelAndView;
    }
	
	@RequestMapping(value = "/addTaskPage", method = RequestMethod.POST)
    public ModelAndView addTaskPage(
    							  @RequestParam(value = "major", defaultValue = "0") int majorId,
    							  @RequestParam(value = "setUpDate", defaultValue = "2016-06-06") String date,
    							  @RequestParam(value = "chkAll", defaultValue = "") String[] ids
    							  ) {
        ModelAndView modelAndView = new ModelAndView();
        Task task = new Task();
        task.setDate(date);
        task.setMajorId(majorId);
        task.setQuestionIds(ids);
        task.setAddState(1);
        teacherService.insertTask(task);
        modelAndView.setView(this.getRedirectView(QUESTION_TASK_LIST_PAGE));
        return modelAndView;
    }
	
	@RequestMapping(value = "/addRandomTaskJsp", method = RequestMethod.GET)
    public ModelAndView addRandomTaskJsp() {
		User user = this.getUser();
        ModelAndView modelAndView = new ModelAndView();
        List<Major> majorList = teacherService.getMajorList(user.getId());
        modelAndView.addObject("majorList", majorList);
        modelAndView.setViewName(QUESTION_RANDOM_TASK_JSP);
        return modelAndView;
    }
	
	@RequestMapping(value = "/addRandomTask", method = RequestMethod.GET)
    public ModelAndView addRandomTask(
						    		  @RequestParam(value = "major", defaultValue = "0") int majorId,
									  @RequestParam(value = "setUpDate", defaultValue = "2016-06-06") String date,
									  @RequestParam(value = "questionNumber", defaultValue = "1") int questionNumber,
									  @RequestParam(value = "chapterId", defaultValue = "1") int chapterId
						    		  ) {
        ModelAndView modelAndView = new ModelAndView();
        Task task = new Task();
        task.setMajorId(majorId);
        task.setDate(date);
        teacherService.insertRandomTask(task, chapterId, questionNumber);
        modelAndView.setView(this.getRedirectView(QUESTION_TASK_LIST_PAGE));
        return modelAndView;
    }
	
	@RequestMapping(value = "/getTaskList", method = RequestMethod.GET)
    public ModelAndView getTaskList() {
		User user = this.getUser();
        ModelAndView modelAndView = new ModelAndView();
        List<Task> taskList = teacherService.getTaskList();
        modelAndView.addObject("taskList", taskList);
        modelAndView.addObject("user", user);
        modelAndView.setViewName(QUESTION_TASK_LIST_JSP);
        
        return modelAndView;
    }
	
	@RequestMapping(value = "/deleteTask", method = RequestMethod.POST)
    public ModelAndView deleteTask(
    						   	   @RequestParam(value = "chkAll", defaultValue = "1") String[] ids
    							   ) {
        ModelAndView modelAndView = new ModelAndView();
        teacherService.deleteTask(ids);
        modelAndView.setView(this.getRedirectView(QUESTION_TASK_LIST_PAGE));
        
        return modelAndView;
    }
	
	@RequestMapping(value = "/editTask", method = RequestMethod.GET)
    public ModelAndView editTask(
                                @RequestParam(value = "taskId", defaultValue = "1") int taskId
                                ) {
		User user = this.getUser();
        ModelAndView modelAndView = new ModelAndView();
        List<Major> majorList = teacherService.getMajorList(user.getId());
        Task task = teacherService.queryEditTask(taskId);
        List<Question> questionList = teacherService.getAllQuestion(task.getChapterId());
        modelAndView.addObject("user", user);
        modelAndView.addObject("majorList", majorList);
        modelAndView.addObject("questionList", questionList);
        modelAndView.addObject("task", task);
        modelAndView.setViewName(QUESTION_EDIT_TASK_JSP);
        
        return modelAndView;
    }
	
	@RequestMapping(value = "/updateTask", method = RequestMethod.POST)
    public ModelAndView updateTask(
								  @RequestParam(value = "major", defaultValue = "0") int majorId,
								  @RequestParam(value = "setUpDate", defaultValue = "2016-06-06") String date,
								  @RequestParam(value = "chkAll", defaultValue = "") String[] ids,
								  @RequestParam(value = "taskId", defaultValue = "1") int taskId
                                  ) {
		 ModelAndView modelAndView = new ModelAndView();
         Task task = new Task();
         task.setDate(date);
         task.setMajorId(majorId);
         task.setQuestionIds(ids);
         task.setAddState(1);
         task.setTaskId(taskId);
         teacherService.updateTask(task);
         modelAndView.setView(this.getRedirectView(QUESTION_TASK_LIST_PAGE));
        
         return modelAndView;
    }
	
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
    public ModelAndView updateTask() {
		 User user = this.getUser();
		 ModelAndView modelAndView = new ModelAndView();
		 List<SignIn> signInList = teacherService.querySignInList(user.getId());
		 modelAndView.addObject("user", user);
		 modelAndView.addObject("signInList", signInList);
         modelAndView.setViewName(QUESTION_SIGN_IN_JSP);
         return modelAndView;
    }
	
	@RequestMapping(value = "/signInDetail", method = RequestMethod.GET)
    public ModelAndView signInDetail(
									@RequestParam(value = "majorName", defaultValue = "信管一班") String majorName,
									@RequestParam(value = "date", defaultValue = "2016-06-06") String date
    								) {
		 User user = this.getUser();
		 ModelAndView modelAndView = new ModelAndView();
		 List<SignIn> signInDeailList = teacherService.signInDetail(majorName, date);
		 modelAndView.addObject("user", user);
		 modelAndView.addObject("majorName", majorName);
		 modelAndView.addObject("date", date);
		 modelAndView.addObject("signInList", signInDeailList);
         modelAndView.setViewName(QUESTION_SIGN_IN_DETAIL_JSP);
         return modelAndView;
    }
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
 	public String download(
 						  @RequestParam(value = "majorName", defaultValue = "信管一班") String majorName,
 						  @RequestParam(value = "date", defaultValue = "2016-06-06") String date,
 						  @RequestParam(value = "studentName", defaultValue = "xuan") String studentName,
						  @RequestParam(value = "studentId", defaultValue = "311209030214") String studentId,
 						  HttpServletRequest request, HttpServletResponse response
 						  ){
		response.setContentType("text/html;charset=utf-8");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		java.io.BufferedInputStream bis = null;
		java.io.BufferedOutputStream bos = null;
		String ctxPath = request.getSession().getServletContext().getRealPath("/") + "upload/" + majorName + date +"/"; 
		String downLoadPath = ctxPath + studentId + studentName + ".zip";
		System.out.println(downLoadPath);
		try {
			long fileLength = new File(downLoadPath).length();
			response.setContentType("application/x-msdownload;");
			response.setHeader("Content-disposition", "attachment; filename=" + new String((studentId + studentName + ".zip").getBytes("utf-8"), "ISO8859-1"));
			response.setHeader("Content-Length", String.valueOf(fileLength));
			bis = new BufferedInputStream(new FileInputStream(downLoadPath));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (bis != null)
				try {
					bis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			if (bos != null)
				try {
					bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		return null;
	}
}
