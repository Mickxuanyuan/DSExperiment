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
	private static final String ADMIN_STUDENTLIST_JSP = "admin/student_list";
	private static final String ADMIN_MAJORLIST_JSP = "admin/major_list";
	private static final String ADD_TEACHER_JSP = "admin/add_teacher";
	private static final String ADMIN_TEACHERLIST_PAGE = "admin/teacherList";
	private static final String EDIT_TEACHER_JSP = "admin/edit_teacher";
	private static final String EDIT_STUDENT_JSP = "admin/edit_student";
	private static final String ADMIN_STUDENT_PAGE = "admin/studentList";
	private static final String ADD_STUDENT_JSP = "admin/add_student";
	private static final String ADMIN_MAJOR_PAGE = "admin/majorList";
	private static final String ADD_MAJOR_JSP = "admin/add_major";
	private static final String EDIT_Major_JSP = "admin/edit_major";
	
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
	    if (majorId == 0) {
		    majorId = majorList.get(0).getId();
	    }
        List<User> studentList = adminService.getStudentList(majorId);
        modelAndView.addObject("studentList", studentList);
        modelAndView.addObject("majorList", majorList);
        modelAndView.addObject("majorId", majorId);
        modelAndView.setViewName(ADMIN_STUDENTLIST_JSP);
        return modelAndView;
    }
	
	@RequestMapping(value = "/majorList", method = RequestMethod.GET)
    public ModelAndView studentList() {
	    ModelAndView modelAndView = new ModelAndView();
		List<Major> majorList = adminService.getMajorList();
        modelAndView.addObject("majorList", majorList);
        modelAndView.setViewName(ADMIN_MAJORLIST_JSP);
        return modelAndView;
    }
	
	@RequestMapping(value = "/addTeacherJsp", method = RequestMethod.GET)
    public ModelAndView addTeacherJsp() {
	    ModelAndView modelAndView = new ModelAndView();
	    List<Major> majorList = adminService.getMajorList();
	    modelAndView.addObject("majorList", majorList);
        modelAndView.setViewName(ADD_TEACHER_JSP);
        return modelAndView;
    }
	
	@RequestMapping(value = "/addTeacherAction", method = RequestMethod.POST)
    public ModelAndView addTeacherAction(
    									@RequestParam(value = "teacherId", defaultValue = "0") String teacherId,
    									@RequestParam(value = "teacherName", defaultValue = "0") String teacherName,
    									@RequestParam(value = "teacherTel", defaultValue = "0") String teacherTel,
    									@RequestParam(value = "teacherEmail", defaultValue = "0") String teacherEmail,
    									@RequestParam(value = "class", defaultValue = "0") int[] majorIds
    									) {
	    ModelAndView modelAndView = new ModelAndView();
	    User user = new User();
	    user.setUserId(teacherId);
	    user.setUsername(teacherName);
	    user.setTelephone(teacherTel);
	    user.setEmail(teacherEmail);
	    user.setMajorIds(majorIds);
	    adminService.insertTeacher(user);
        modelAndView.setView(this.getRedirectView(ADMIN_TEACHERLIST_PAGE));
        return modelAndView;
    }
	
	@RequestMapping(value = "/editTeacherJsp", method = RequestMethod.GET)
    public ModelAndView editTeacherJsp(
    								@RequestParam(value = "teacherId", defaultValue = "0") int teacherId
    								) {
	    ModelAndView modelAndView = new ModelAndView();
	    List<Major> majorList = adminService.getMajorList();
	    User teacher = adminService.getTeacherInfoToEdit(teacherId);
	    modelAndView.addObject("majorList", majorList);
	    modelAndView.addObject("teacher", teacher);
        modelAndView.setViewName(EDIT_TEACHER_JSP);
        return modelAndView;
    }
	
	@RequestMapping(value = "/editTeacherAction", method = RequestMethod.POST)
    public ModelAndView TeacherAction(
    									@RequestParam(value = "id", defaultValue = "0") int id,
    									@RequestParam(value = "teacherId", defaultValue = "0") String teacherId,
    									@RequestParam(value = "teacherName", defaultValue = "0") String teacherName,
    									@RequestParam(value = "teacherTel", defaultValue = "0") String teacherTel,
    									@RequestParam(value = "teacherEmail", defaultValue = "0") String teacherEmail,
    									@RequestParam(value = "class", defaultValue = "0") int[] majorIds
    									) {
	    ModelAndView modelAndView = new ModelAndView();
	    User user = new User();
	    user.setId(id);
	    user.setUserId(teacherId);
	    user.setUsername(teacherName);
	    user.setTelephone(teacherTel);
	    user.setEmail(teacherEmail);
	    user.setMajorIds(majorIds);
	    adminService.updateTeacher(user);
        modelAndView.setView(this.getRedirectView(ADMIN_TEACHERLIST_PAGE));
        return modelAndView;
    }
	
	@RequestMapping(value = "/deleteTeacher", method = RequestMethod.POST)
    public ModelAndView deleteQuestion(
    						   @RequestParam(value = "chkAll", defaultValue = "1") String[] ids
    									) {
        ModelAndView modelAndView = new ModelAndView();
        adminService.deleteTeacher(ids);
        modelAndView.setView(this.getRedirectView(ADMIN_TEACHERLIST_PAGE));
        
        return modelAndView;
    }
	
	@RequestMapping(value = "/editStudentJsp", method = RequestMethod.GET)
    public ModelAndView editStudentJsp(
    								@RequestParam(value = "studentId", defaultValue = "0") int studentId
    								) {
	    ModelAndView modelAndView = new ModelAndView();
	    User student = adminService.getStudentInfoToEdit(studentId);
	    modelAndView.addObject("student", student);
        modelAndView.setViewName(EDIT_STUDENT_JSP);
        return modelAndView;
    }
	
	@RequestMapping(value = "/editStudentAction", method = RequestMethod.POST)
    public ModelAndView editStudentAction(
    									@RequestParam(value = "id", defaultValue = "0") int id,
    									@RequestParam(value = "teacherId", defaultValue = "0") String teacherId,
    									@RequestParam(value = "teacherName", defaultValue = "0") String teacherName,
    									@RequestParam(value = "teacherTel", defaultValue = "0") String teacherTel,
    									@RequestParam(value = "teacherEmail", defaultValue = "0") String teacherEmail,
    									@RequestParam(value = "class", defaultValue = "0") int[] majorIds
    									) {
	    ModelAndView modelAndView = new ModelAndView();
	    User user = new User();
	    user.setId(id);
	    user.setUserId(teacherId);
	    user.setUsername(teacherName);
	    user.setTelephone(teacherTel);
	    user.setEmail(teacherEmail);
	    user.setMajorIds(majorIds);
	    adminService.updateStudent(user);
        modelAndView.setView(this.getRedirectView(ADMIN_STUDENT_PAGE));
        return modelAndView;
    }
	
	@RequestMapping(value = "/addStudentJsp", method = RequestMethod.GET)
    public ModelAndView addStudentJsp() {
	    ModelAndView modelAndView = new ModelAndView();
	    List<Major> majorList = adminService.getMajorList();
	    modelAndView.addObject("majorList", majorList);
        modelAndView.setViewName(ADD_STUDENT_JSP);
        return modelAndView;
    }
	
	@RequestMapping(value = "/addStudentAction", method = RequestMethod.POST)
    public ModelAndView addStudentAction(
    									@RequestParam(value = "teacherId", defaultValue = "0") String teacherId,
    									@RequestParam(value = "teacherName", defaultValue = "0") String teacherName,
    									@RequestParam(value = "teacherTel", defaultValue = "0") String teacherTel,
    									@RequestParam(value = "teacherEmail", defaultValue = "0") String teacherEmail,
    									@RequestParam(value = "major", defaultValue = "1") int major
    									) {
	    ModelAndView modelAndView = new ModelAndView();
	    User user = new User();
	    user.setUserId(teacherId);
	    user.setUsername(teacherName);
	    user.setTelephone(teacherTel);
	    user.setEmail(teacherEmail);
	    user.setMajorId(major);
	    adminService.insertStudent(user);
        modelAndView.setView(this.getRedirectView(ADMIN_STUDENT_PAGE));
        return modelAndView;
    }
	
	@RequestMapping(value = "/deleteStudent", method = RequestMethod.POST)
    public ModelAndView deleteStudent(
    			                      @RequestParam(value = "chkAll", defaultValue = "1") String[] ids
    								  ) {
        ModelAndView modelAndView = new ModelAndView();
        adminService.deleteStudent(ids);
        modelAndView.setView(this.getRedirectView(ADMIN_STUDENT_PAGE));
        return modelAndView;
    }
	
	@RequestMapping(value = "/deleteMajor", method = RequestMethod.POST)
    public ModelAndView deleteMajor(
    						   @RequestParam(value = "chkAll", defaultValue = "1") String[] ids
    									) {
        ModelAndView modelAndView = new ModelAndView();
        adminService.deleteMajor(ids);
        modelAndView.setView(this.getRedirectView(ADMIN_MAJOR_PAGE));
        
        return modelAndView;
    }
	
	@RequestMapping(value = "/addMajorJsp", method = RequestMethod.GET)
    public ModelAndView addMajorJsp() {
	    ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(ADD_MAJOR_JSP);
        return modelAndView;
    }
	
	@RequestMapping(value = "/addMajorAction", method = RequestMethod.POST)
    public ModelAndView addMajorAction(
    									@RequestParam(value = "majorName", defaultValue = "0") String majorName
    									) {
	    ModelAndView modelAndView = new ModelAndView();
	    adminService.insertMajor(majorName);
        modelAndView.setView(this.getRedirectView(ADMIN_MAJOR_PAGE));
        return modelAndView;
    }
	
	@RequestMapping(value = "/editMajorJsp", method = RequestMethod.GET)
    public ModelAndView editMajorJsp(
    								@RequestParam(value = "majorId", defaultValue = "0") int majorId,
    								@RequestParam(value = "majorName", defaultValue = "0") String majorName
    								) {
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.addObject("majorName", majorName);
	    modelAndView.addObject("majorId", majorId);
        modelAndView.setViewName(EDIT_Major_JSP);
        return modelAndView;
    }
	
	@RequestMapping(value = "/editMajorAction", method = RequestMethod.POST)
    public ModelAndView editMajorAction(
    									@RequestParam(value = "majorId", defaultValue = "0") int majorId,
    									@RequestParam(value = "majorName", defaultValue = "0") String majorName
    									) {
	    ModelAndView modelAndView = new ModelAndView();
	    Major major = new Major();
	    major.setId(majorId);
	    major.setName(majorName);
	    adminService.updateMajor(major);
        modelAndView.setView(this.getRedirectView(ADMIN_MAJOR_PAGE));
        return modelAndView;
    }
}
