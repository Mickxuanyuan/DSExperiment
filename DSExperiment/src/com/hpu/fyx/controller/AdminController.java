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
import com.hpu.fyx.model.User;
import com.hpu.fyx.service.AdminService;

@Controller
@RequestMapping(Constants.APP_URL_ADMIN_PREFIX)
public class AdminController extends BaseController {
	
	private static final String ADMIN_TEACHERLIST_JSP = "admin/teacher_list";
	
	@Autowired
    private AdminService adminService;

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping(value = "/teacherList", method = RequestMethod.GET)
    public ModelAndView teacherList() {
        ModelAndView modelAndView = new ModelAndView();
        List<User> teacherList = adminService.getTeacherList();
        modelAndView.addObject("teacherList", teacherList);
        modelAndView.setViewName(ADMIN_TEACHERLIST_JSP);
        return modelAndView;
	}

	
	@RequestMapping(value = "/studentList", method = RequestMethod.GET)
    public ModelAndView studentList(
    								@RequestParam(value = "majorId", defaultValue = "0") int majorId
    								) {
	    ModelAndView modelAndView = new ModelAndView();
		List<Major> majorList = adminService.getMajorList();
        List<User> teacherList = adminService.getTeacherList();
        modelAndView.addObject("studentList", teacherList);
        modelAndView.setViewName(ADMIN_TEACHERLIST_JSP);
        return modelAndView;
    }
}
