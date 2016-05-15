package com.hpu.fyx.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hpu.fyx.common.Constants;
import com.hpu.fyx.model.Pagination;
import com.hpu.fyx.model.Question;
import com.hpu.fyx.model.User;
import com.hpu.fyx.service.StudentService;

@Controller
@RequestMapping(Constants.APP_URL_STUDENT_PREFIX)
public class StudentController extends BaseController{
	private static final String QUESTION_LIST_JSP = "student/student_question_list";
	private static final String DAILY_TASK_JSP = "student/student_task";
	private static final String DAILY_TASK_PAGE = "student/dailyTask";
	
	
	@Autowired
    private StudentService studentService;

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
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

        pagination = studentService.searchQuestionList(pagination);
        modelAndView.addObject("pagination", pagination);
        modelAndView.addObject("user", user);
        modelAndView.setViewName(QUESTION_LIST_JSP);
        
        return modelAndView;
	    }
	 
	 	@RequestMapping(value = "/dailyTask", method = RequestMethod.GET)
	    public ModelAndView myTask() {
	        User user = this.getUser();
	        ModelAndView modelAndView = new ModelAndView();
	        int signInStatus = studentService.querySignIn(user.getId());
	        List<Question> questionList = studentService.queryDailyTask(user.getId());
	        modelAndView.addObject("questionList", questionList);
	        modelAndView.addObject("user", user);
	        modelAndView.addObject("signInStatus", signInStatus);
	        modelAndView.setViewName(DAILY_TASK_JSP);
	        
	        return modelAndView;
	    }
	 
	 	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	    public ModelAndView mySignIn() {
	        User user = this.getUser();
	        ModelAndView modelAndView = new ModelAndView();
	        studentService.insertSignIn(user.getId());
	        modelAndView.setView(this.getRedirectView(DAILY_TASK_PAGE));
	        return modelAndView;
	    }
	 
	 	@RequestMapping(value = "/uploadTask", method = RequestMethod.POST)
	 	public ModelAndView upload(@RequestParam(value = "taskFile", required = false) MultipartFile file, HttpServletRequest request) {  
	 		User user = this.getUser();
	 		String majorName = user.getMajorName();
	 		
 		    Date dt=new Date();
 	        SimpleDateFormat matter1=new SimpleDateFormat("yyyy-MM-dd");
 	        String date = matter1.format(dt);
	        String path = request.getSession().getServletContext().getRealPath("upload/" + majorName + date);  
	        String fileName = file.getOriginalFilename();  
	        File targetFile = new File(path, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        } 
	        //保存  
	        try {  
	            file.transferTo(targetFile);
	            studentService.insertUploadInfo(user.getId());
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        ModelAndView modelAndView = new ModelAndView();
	        modelAndView.setView(this.getRedirectView(DAILY_TASK_PAGE));
	        return modelAndView;
	    }  
	 	
	 	
}
