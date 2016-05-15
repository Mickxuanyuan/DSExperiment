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
	
	function submitEdit(id) {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/editQuestion")%>" + "?questionId=" + id;
		window.location.href = turnUrl;
	}
	
	function submitDetail(id) {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/detailQuestion")%>" + "?questionId=" + id;
		window.location.href = turnUrl;
	}
	
	function runToSignDetail(majorName, date) {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/signInDetail")%>" + "?majorName=" + majorName + "&date=" + date;
		window.location.href = turnUrl;
	}
	
	function deleteQuestions() {
		var deleteFormObj = document.getElementById("deleteForm");
		deleteFormObj.submit();
	}
</script>
</head>
<body style="margin:0px;height: 760px;width:100%">
	<div class="warpper">
		<div class="header">
			<a class="header_title">数据结构上机系统</a> <label class="header_logout">注销</label>
			<label class="header_login_name">${user.username}</label> <img
				class="header_img"
				src="<%=PropertyUtil.getStaticUrl()%>/images/ICN_Web_PersonalInformation_25x25.png"></img>
		</div>

		<div class="breadcrumb">
			<div class="breadcrumb_question" style="background:#D2DAE3;"
				onclick="runToQuestionList()">问题列表</div>
			<div class="breadcrumb_task" onclick="runToDailyTask()">发布任务</div>
			<div class="breadcrumb_sign_in" onclick="runToSignInDetail()">签到详情</div>
			<div class="breadcrumb_home" onclick="runToPersonalHome()">个人主页</div>
		</div>

		<div class="center_main">
			<div class="main_right" style="left:280px;">

				<div class="div_main_center" style="width:800px; overflow: auto;">

					<div class="div_main_center_one">
						<ul style="list-style:none;margin:0px">
							<li class="div_main_center_one_li11">ID</li>
							<li class="div_main_center_one_li21" style="left:230px">班级</li>
							<li class="div_main_center_one_li31" style="left:230px">时间</li>
							<li class="div_main_center_one_li41" style="left:580px">应到</li>
							<li class="div_main_center_one_li51" style="left:700px; width:100px;">实到</li>
						</ul>
					</div>
					<form action="<%=PathUtil.getFullPath("teacher/deleteQuestion")%>" method="POST" id="deleteForm">
					<div class="div_main_center_two">
					<%int i = 1; %>
					<c:forEach items="${signInList}" var="o">
						<div class="div_main_center_two1">
							<ul style="list-style:none;margin:0px; cursor: pointer;" onclick="runToSignDetail('${o.major}', '${o.date}')">
								<li class="div_main_center_two_li11"><%=i++%></li>
								<li class="div_main_center_two_li21">T<fmt:formatNumber type="number" pattern="######" minIntegerDigits="6" value="${o.taskId}"/></li>
								<li class="div_main_center_two_li31" style="left:180px" >${o.major}</li>
								<li class="div_main_center_two_li41" style="left:230px">${o.date}</li>
								<li class="div_main_center_two_li51" style="left:585px; background: white;cursor: default;">${o.signNumber}</li>
								<li class="div_main_center_two_li6" style="left:700px; width:100px;">${o.unSignNumber}</li>
							</ul>
						</div>
					</c:forEach>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
