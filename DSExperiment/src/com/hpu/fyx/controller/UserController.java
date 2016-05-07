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
	        User user = null;
	        user = userService.login(userName, password);
	        this.addSession(Constants.USER, user);
	
	        if (user.getUserRole() == 2)
	        {
	        	//学生
	        	redirectView = this.getRedirectView(QUESTION_LIST_PAGE);
	        } else {
	        	//老师
	        	redirectView = this.getRedirectView("book/mybook1");
	        }
	                                                         
	        modelAndView.setView(redirectView);
	    } catch (ParameterException parameterException) {
	        Map<String, String> errorFields = parameterException.getErrorFields();
	        modelAndView.addObject(Constants.ERROR_FIELDS, errorFields);
	        modelAndView.setViewName(LOGIN_JSP);
	    } catch (ServiceException serviceException) {
	        modelAndView.addObject(Constants.TIP_MESSAGE, serviceException.getMessage() + "[" + serviceException.getCode() + "]");
	        modelAndView.setViewName(LOGIN_JSP);
	    }
	    return modelAndView;
	}
}
