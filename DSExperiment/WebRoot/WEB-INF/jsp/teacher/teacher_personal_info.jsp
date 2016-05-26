<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hpu.fyx.utils.PropertyUtil" %>
<%@ page import="com.hpu.fyx.utils.PathUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>welcome</title>
<link href="<%=PropertyUtil.getStaticUrl()%>/style/student_home.css" rel="stylesheet" type="text/css">
<link href="<%=PropertyUtil.getStaticUrl()%>/style/teacher_home.css" rel="stylesheet" type="text/css">
<script>
	
	function initialColorBreadcrumb(name) {
		var breadcrumbDiv = document.getElementsByTagName("div");
		alert(${pagination.currentPage});
		for (var i = 0; i < breadcrumbDiv.length; i++) {

			if (breadcrumbDiv[i].className == "breadcrumb") {
				var breadcrumbDivChild = breadcrumbDiv[i]
						.getElementsByTagName("div");

				for (i = 0; i < breadcrumbDivChild.length; i++) {
					if (breadcrumbDivChild[i].className != name) {
						breadcrumbDivChild[i].style.color = "#2E4358";
						breadcrumbDivChild[i].style.background = "#ffffff";
					} else {
						breadcrumbDivChild[i].style.color = "#2e4358";
						breadcrumbDivChild[i].style.background = "#D2DAE3";
					}
				}
			}
		}
	}

	function runToQuestionList() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/questionList")%>";
		window.location.href = turnUrl;
	}
	
	function runToDailyTask() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/getTaskList")%>";
		window.location.href = turnUrl;
	}
	
	function runToSignInDetail() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/signIn")%>";
		window.location.href = turnUrl;
	}
	
	function logout() {
		var turnUrl = "<%=PathUtil.getFullPath("user/logout")%>";
		window.location.href = turnUrl;
	}
	
	function runToTotal () {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/signInTotal")%>";
		window.location.href = turnUrl;
	}
	
	function runToChangePassword() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/changePassword")%>";
		window.location.href = turnUrl;
	}
</script>
</head>
<body style="margin:0px;height: 760px;width:100%">
	<div class="warpper">
	
		<div class="header">
			<a class="header_title">数据结构上机系统</a>
			<label class="header_logout" style="cursor: pointer;" onclick="logout()">注销</label>
			<label class="header_login_name">${user.username}</label>
			<img class="header_img" src="<%=PropertyUtil.getStaticUrl()%>/images/ICN_Web_PersonalInformation_25x25.png"></img>
		</div>
		
		<div class="breadcrumb">
			<div class="breadcrumb_question" 
				onclick="runToQuestionList()" style="cursor: pointer;">问题列表</div>
			<div class="breadcrumb_task" onclick="runToDailyTask()" style="cursor: pointer;">发布任务</div>
			<div class="breadcrumb_sign_in" style="cursor: pointer;" onclick="runToSignInDetail()">签到详情</div>
			<div class="breadcrumb_total" onclick="runToTotal()" style="cursor: pointer;">签到总结</div>
			<div class="breadcrumb_home" onclick="runToPersonalHome()" style="background:#D2DAE3;cursor: pointer;">个人主页</div>
		</div>
		
		<div class="center_main">
		
			<div class="main_left">
				<hr style="width:180px; position:absolute; top:50px;margin:0px" />
				<div class="1" onclick="initialColor('1')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#2E4358;font-family:Arial;color: #ffffff;position: absolute;top:51px">个人信息</div>
				<hr style="width:180px; position:absolute; top:80px;margin:0px" />
				<div class="2" onclick="runToChangePassword()" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:81px">修改密码</div>
				<hr style="width:180px; position:absolute; top:110px;margin:0px" />
			</div>
			
			<hr class="main_hr2"/>
			
			<div class="main_right">
				
				<div class="div_main_center" style="width:300px;left:300px;border:none;">
					<label >姓名&nbsp;:</label>
					<label class="chapter_select_major" style="width:178px;height:25px;position: absolute; left:150px;top:0px;">${user.username }</label>
					
					<label style="width: 100px;height:30px;position: absolute; left:0px;top:60px;">学号&nbsp;:</label>
					<label class="chapter_select_question_number" style="width:178px;height:25px;position: absolute; left:150px;top:60px;" >${user.userId }</label>
					
					<label style="width: 100px;height:30px;position: absolute; left:0px;top:120px;">电话号码&nbsp;:</label>
					<label class="chapter_select_question_number" style="width:178px;height:25px;position: absolute; left:150px;top:120px;" >${user.telephone}</label>
					
					<label style="width: 100px;height:30px;position: absolute; left:0px;top:180px;">邮箱&nbsp;:</label>
					<label class="chapter_select_question_number" style="width:178px;height:25px;position: absolute; left:150px;top:180px;" >${user.email}</label>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
