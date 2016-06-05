<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hpu.fyx.utils.PropertyUtil"%>
<%@ page import="com.hpu.fyx.utils.PathUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加问题</title>
<link href="<%=PropertyUtil.getStaticUrl()%>/style/student_home.css" rel="stylesheet" type="text/css">
<link href="<%=PropertyUtil.getStaticUrl()%>/style/teacher_home.css" rel="stylesheet" type="text/css">
<script>
function submitCancel() {
	var turnUrl = "<%=PathUtil.getFullPath("admin/studentList")%>";
	window.location.href = turnUrl;
}

function submitForm() {
	var editFormObj = document.getElementById("editForm");
/* 	var questionTitleObj = document.getElementById("questionTitle");
	var questionDescriptionObj = document.getElementById("questionDescription");
	var isSubmitForm = true;
	 if (!questionTitleObj.value) {
		 questionTitleObj.style.border="1px dashed #EB340A";
         isSubmitForm = false;
     } else {
    	 questionTitleObj.style.cssText = "border: 1px solid #858585;";
     }
	 
	 if (!questionDescriptionObj.value) {
		 questionDescriptionObj.style.border="1px dashed #EB340A";
         isSubmitForm = false;
     } else {
    	 questionDescriptionObj.style.cssText = "border: 0px solid #858585;";
     }

     if (isSubmitForm) { */
    	 editFormObj.submit();
    // }
	
     function logout() {
 		var turnUrl = "<%=PathUtil.getFullPath("user/logout")%>";
 		window.location.href = turnUrl;
 	}
}
</script>

</head>
  <body style="margin:0px;height: 760px;width:100%">
	<div class="warpper">
	
		<div class="header">
			<a class="header_title">数据结构上机系统</a>
			<label class="header_logout" style="cursor: pointer;" onclick="logout()">注销</label>
			<label class="header_login_name">管理员</label>
			<img class="header_img" src="<%=PropertyUtil.getStaticUrl()%>/images/ICN_Web_PersonalInformation_25x25.png"></img>
		</div>
		<div class="main_center">
		<div class="main_center_top">
			<label>老师列表&nbsp;--</label><label class="edit_question_id_l" style="width:300px;">老师信息编辑&nbsp;--</label>
		</div>
		<form  action="<%=PathUtil.getFullPath("admin/editStudentAction")%>" method="POST" id="editForm">
		<div class="center_question">
		
			<label >老师工号&nbsp;:</label>
			<input id="teacherId" value="${student.userId}" name="teacherId" style="width:173px;height:21px; position: absolute; left:150px;top:0px;"/>
			<label class="edit_question_center_title_l" style="top:50px">老师姓名&nbsp;:</label>
			<input class="edit_question_center_title" style="top:50px" value="${student.username }" id="teacherName" name="teacherName"/>
			<label class="edit_question_center_title_l" >电话&nbsp;:</label>
			<input class="edit_question_center_title" id="teacherTel" value="${student.telephone}" name="teacherTel"></input>
			<label class="edit_question_center_discription_l" >邮箱&nbsp;:</label>
			<input class="edit_question_center_title" style="top:150px" id="teacherEmail" value="${student.email}" name="teacherEmail"/>
			
			<input id="id" value="${student.id}" name="id" style="visibility: hidden;"/>
			<div class="button_sure" onclick="submitForm()">确认</div>
			<div class="button_cancel" onclick="submitCancel()">返回</div>
		</div>
		</form>
		</div>
	</div>
  </body>
</html>
