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
<title>发布任务</title>
<link href="<%=PropertyUtil.getStaticUrl()%>/style/student_home.css" rel="stylesheet" type="text/css">
<link href="<%=PropertyUtil.getStaticUrl()%>/style/teacher_home.css" rel="stylesheet" type="text/css">

<script>
	function runToQuestionList() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/questionList")%>";
		window.location.href = turnUrl;
	}
	
	function runToDailyTask() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/getTaskList")%>";
		window.location.href = turnUrl;
	}
	
	function runToTaskList() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/getTaskList")%>";
		window.location.href = turnUrl;
	}
	
	function runToAddTask() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/addTaskJsp")%>";
		window.location.href = turnUrl;
	}
	
	function CheckAll()  
    {  
	   var allCheckBoxs=document.getElementsByName("chkAll") ;
	   for (var i=0;i<allCheckBoxs.length ;i++){
	       if(allCheckBoxs[i].type=="checkbox"){
	    	   if (allCheckBoxs[i].checked==true) {
	    		   allCheckBoxs[i].checked=false;
	    	   } else {
	    		   allCheckBoxs[i].checked=true;
	    	   }
	       }
	    }  
    }  

	function runToRandomTask() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/addRandomTaskJsp")%>";
		window.location.href = turnUrl;
	}
	
	function deleteTask() {
		var deleteFormObj = document.getElementById("deleteForm");
		deleteFormObj.submit();
	}
	
	function submitEdit(id) {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/editTask")%>" + "?taskId=" + id;
		window.location.href = turnUrl;
	}
	
	function submitChapterInfo() {
		var major = document.getElementById("major").value;
		var date = document.getElementById("setUpDate").value;
		var chapterId = document.getElementById("chapterId").value;
		var turnUrl = "<%=PathUtil.getFullPath("teacher/assignTask")%>" + "?major=" + major + "&date=" + date + "&chapterId=" + chapterId;
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
	
	function runToPersonalInfo() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/info")%>";
		window.location.href = turnUrl;
	}
	
	function runToTotal () {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/signInTotal")%>";
		window.location.href = turnUrl;
	}
</script>
</head>
<body style="margin:0px;height: 760px;width:100%">
	<div class="warpper">
		<div class="header">
			<a class="header_title">数据结构上机系统</a> <label class="header_logout"  style="cursor: pointer;" onclick="logout()">注销</label>
			<label class="header_login_name">${user.username}</label> <img
				class="header_img"
				src="<%=PropertyUtil.getStaticUrl()%>/images/ICN_Web_PersonalInformation_25x25.png"></img>
		</div>

		<div class="breadcrumb">
			<div class="breadcrumb_question"
				onclick="runToQuestionList()" style="cursor: pointer;">问题列表</div>
			<div class="breadcrumb_task" style="background:#D2DAE3;cursor: pointer;" onclick="runToDailyTask()">发布任务</div>
			<div class="breadcrumb_sign_in" onclick="runToSignInDetail()" style="cursor: pointer;">签到详情</div>
			<div class="breadcrumb_total" onclick="runToTotal()" style="cursor: pointer;">签到总结</div>
			<div class="breadcrumb_home" onclick="runToPersonalInfo()" style="cursor: pointer;">个人主页</div>
		</div>

		<div class="center_main">
			<div class="main_left">
				<hr style="width:180px; position:absolute; top:50px;margin:0px" />
				<div class="1" onclick="runToTaskList()" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#2E4358;font-family:Arial;color: #ffffff;position: absolute;top:51px">
				任务列表</div>
				<hr style="width:180px; position:absolute; top:80px;margin:0px" />
				<div class="2" onclick="runToAddTask()" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2E4358;position: absolute;top:81px">
				指定任务</div>
				<hr style="width:180px; position:absolute; top:110px;margin:0px" />
				<div class="3" onclick="runToRandomTask()" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:111px">
				随机任务</div>
				<hr style="width:180px; position:absolute; top:140px;margin:0px" />
			</div>

			<hr class="main_hr2" />
			<div class="main_right">
				<div class="div_main_center"> 
					<div class="div_main_center_one">
						<ul style="list-style:none;margin:0px">
							<li class="div_main_center_one_li11">ID</li>
							<li class="div_main_center_one_li21">班级</li>
							<li class="div_main_center_one_li311">时间</li>
							<li class="div_main_center_one_li411">生成方式</li>
							<li class="div_main_center_one_li41">编辑</li>
							<li class="div_main_center_one_li51"><input type="checkBox" onclick="CheckAll()"/></li>
						</ul>
					</div>
					<form action="<%=PathUtil.getFullPath("teacher/deleteTask")%>" method="POST" id="deleteForm">
					<div class="div_main_center_two" style="height: 369px">
					<%int i = 1; %>
					<c:forEach items="${taskList}" var="o">
						<div class="div_main_center_two1" >
							<ul style="list-style:none;margin:0px;">
								<li class="div_main_center_two_li11"><%=i++%></li>
								<li class="div_main_center_two_li21"   onclick="submitDetail('${o.taskId}')">T<fmt:formatNumber type="number" pattern="######" minIntegerDigits="6" value="${o.taskId}"/></li>
								<li class="div_main_center_two_li31">${o.majorName}</li>
								<li class="div_main_center_two_li411">${o.date}</li>
								<c:if test="${o.addState == '1'}">
								<li class="div_main_center_two_li412">指定生成</li>
								</c:if>
								<c:if test="${o.addState == '2'}">
								<li class="div_main_center_two_li412">随机生成</li>
								</c:if>
								<li class="div_main_center_two_li51" style="left: " onclick="submitEdit('${o.taskId}')"></li>
								<li class="div_main_center_two_li6">
								<input type="checkBox" value="${o.taskId}" name="chkAll" id="chkAll"/></li>
							</ul>
						</div>
					</c:forEach>
					<div class="delete" style="top: 350px" onclick="deleteTask()">删除</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
