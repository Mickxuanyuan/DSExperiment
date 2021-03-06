package com.hpu.fyx.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.hpu.fyx.common.Constants;
import com.hpu.fyx.exception.ParameterException;
import com.hpu.fyx.exception.ServiceException;
import com.hpu.fyx.model.User;
import com.hpu.fyx.service.UserService;

@Controller
@RequestMapping(Constants.APP_URL_USER_PREFIX)
public class UserController extends BaseController {
	
	private final String LOGIN_JSP = "login";
	private final String QUESTION_LIST_PAGE = "student/questionList";
	private final String QUESTION_LIST_TEACHER_PAGE = "teacher/questionList";
	private static final String CHANGE_PASSWORD_JSP = "teacher/teacher_change_password";
	private final String SYSTEM_ADMIN_PAGE = "admin/teacherList";
	
	@Autowired
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(LOGIN_JSP);
        return modelAndView;
    }
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView saveLogin(
                                  @RequestParam(value = "userName", defaultValue = "") String userName,
                                  @RequestParam(value = "password", defaultValue = "") String password
                                  ) {
	    ModelAndView modelAndView = new ModelAndView();
	    RedirectView redirectView = new RedirectView();
	    try {
	    	if ("Admin".equals(userName) && "123".equals(password)) {
	    		redirectView = this.getRedirectView(SYSTEM_ADMIN_PAGE);
	    		User user = new User();
	    		user.setUsername("Admin");
	    		this.addSession(Constants.USER, user);
	    	} else {
	    		User user = null;
	 	        user = userService.login(userName, password);
	 	        this.addSession(Constants.USER, user);
	 	
	 	        if (user.getUserRole() == 2)
	 	        {
	 	        	//学生
	 	        	redirectView = this.getRedirectView(QUESTION_LIST_PAGE);
	 	        } else {
	 	        	//老师
	 	        	redirectView = this.getRedirectView(QUESTION_LIST_TEACHER_PAGE);
	 	        }
	    	}
	                                                         
	        modelAndView.setView(redirectView);
	    } catch (ParameterException parameterException) {
	        Map<String, String> errorFields = parameterException.getErrorFields();
	        modelAndView.addObject(Constants.ERROR_FIELDS, errorFields);
	        modelAndView.setViewName(LOGIN_JSP);
	    } catch (ServiceException serviceException) {
	        modelAndView.addObject(Constants.TIP_MESSAGE, serviceException.getMessage());
	        modelAndView.setViewName(LOGIN_JSP);
	    }
	    return modelAndView;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout() {
        ModelAndView modelAndView = new ModelAndView();
        this.removeSession(Constants.USER);
        modelAndView.setViewName(LOGIN_JSP);
        return modelAndView;
    }
	
	@RequestMapping(value = "/changePwdAction", method = RequestMethod.POST)
    public ModelAndView changePwdAction(
    									@RequestParam(value = "password", defaultValue = "") String password,
										@RequestParam(value = "newPassword", defaultValue = "") String newPassword,
										@RequestParam(value = "reNewPassword", defaultValue = "") String reNewPassword
    									) {
	    ModelAndView modelAndView = new ModelAndView();
		try {
			User user = this.getUser();
			modelAndView.addObject("user", user);
			user = userService.login(user.getUserId(), password);
			userService.updatePassword(user.getUserId(), newPassword, "teacher");
	        modelAndView.setViewName(LOGIN_JSP);
		} catch (ParameterException parameterException) {
	        Map<String, String> errorFields = parameterException.getErrorFields();
	        modelAndView.addObject(Constants.ERROR_FIELDS, errorFields);
	        modelAndView.setViewName(LOGIN_JSP);
	    }catch (ServiceException serviceException) {
	        modelAndView.addObject(Constants.TIP_MESSAGE, serviceException.getMessage());
	        modelAndView.setViewName(CHANGE_PASSWORD_JSP);
	    }
         return modelAndView;
    }
	
	@RequestMapping(value = "/changePwdAction2", method = RequestMethod.POST)
    public ModelAndView changePwdAction2(
    									@RequestParam(value = "password", defaultValue = "") String password,
										@RequestParam(value = "newPassword", defaultValue = "") String newPassword,
										@RequestParam(value = "reNewPassword", defaultValue = "") String reNewPassword
    									) {
	    ModelAndView modelAndView = new ModelAndView();
		try {
			User user = this.getUser();
			modelAndView.addObject("user", user);
			user = userService.login(user.getUserId(), password);
			userService.updatePassword(user.getUserId(), newPassword, "student");
	        modelAndView.setViewName(LOGIN_JSP);
		} catch (ParameterException parameterException) {
	        Map<String, String> errorFields = parameterException.getErrorFields();
	        modelAndView.addObject(Constants.ERROR_FIELDS, errorFields);
	        modelAndView.setViewName(LOGIN_JSP);
	    }catch (ServiceException serviceException) {
	        modelAndView.addObject(Constants.TIP_MESSAGE, serviceException.getMessage());
	        modelAndView.setViewName(CHANGE_PASSWORD_JSP);
	    }
         return modelAndView;
    }
}
