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
	
	function initialColor(name) {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/signInTotal")%>" + "?majorId=" + name;
		window.location.href = turnUrl;
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
	
	function addQuestion() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/addQuestion")%>";
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

	function submitSearchContent() {
		var startDate = document.getElementById("startDate").value;
		var endDate = document.getElementById("endDate").value;
		
		var turnUrl = "<%=PathUtil.getFullPath("teacher/signInTotal")%>" + "?majorId=" + ${majorId} + "&startDate=" + startDate + "&endDate=" + endDate;
		window.location.href = turnUrl;
	}
	
	function deleteQuestions() {
		var deleteFormObj = document.getElementById("deleteForm");
		deleteFormObj.submit();
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
			<div class="breadcrumb_question" style="cursor: pointer;"
				onclick="runToQuestionList()" >问题列表</div>
			<div class="breadcrumb_task" onclick="runToDailyTask()" style="cursor: pointer;">发布任务</div>
			<div class="breadcrumb_sign_in" style="cursor: pointer;" onclick="runToSignInDetail()">签到详情</div>
			<div class="breadcrumb_total" onclick="runToTotal()" style="background:#D2DAE3;cursor: pointer;">签到总结</div>
			<div class="breadcrumb_home" onclick="runToPersonalInfo()" style="cursor: pointer;">个人主页</div>
		</div>

		<div class="center_main">
			<div class="main_left">
				<hr class="main_hr"
					style="width:180px; position:absolute; top:20px;margin:0px" />
					<%int j = 0; %>
				<c:forEach items="${majorList}" var="m">
					<c:if test="${m.id != majorId}">
					<div class='${m.id}' onclick="initialColor('${m.id}')"
				    style="cursor: pointer;font-size:18px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #000000;position: absolute;top:<%=21+30*j%>px">${m.name }</div>
				    </c:if>
				    <c:if test="${m.id == majorId}">
					<div class='${m.id}' onclick="initialColor('${m.id}')"
				    style="cursor: pointer;font-size:18px; width:180px; text-align:center; height:30px; line-height:30px;background:#2E4358;font-family:Arial;color: #ffffff;position: absolute;top:<%=21+30*j%>px">${m.name }</div>
				    </c:if>
				    <hr style="width:180px; position:absolute; top:<%=(50+j*30) %>px;margin:0px" />
				    <%j++; %>
				</c:forEach>
			</div>

			<hr class="main_hr2" />

			<div class="main_right">
				<div>
					<input class="main_right_search" type="date" id="endDate"
						name="endDate" value="${endDate}"/>
					<label class="main_right_search" style="right: 180px;top:13px">——</label>
					<input class="main_right_search" style="right: 250px;padding: 5px 5px 5px 10px;" type="date"
						id="startDate" name="startDate" value="${startDate}"/>
					<img class="search_img" onclick="submitSearchContent()" />
				</div>

				<div class="div_main_center">

					<div class="div_main_center_one">
						<ul style="list-style:none;margin:0px">
							<li class="div_main_center_one_li11">学号</li>
							<li class="div_main_center_one_li21">姓名</li>
							<li class="div_main_center_one_li31">没签到/次</li>
							<li class="div_main_center_one_li41" style="width:60px">没上传/次</li>
						</ul>
					</div>
					<div class="div_main_center_two"  style="overflow: auto">
					<% int i = 1; %>
					<c:forEach items="${studentList}" var="o">
						<div class="div_main_center_two1">
							<ul style="list-style:none;margin:0px;">
								<li class="div_main_center_two_li11"><%=i++%></li>
								<li class="div_main_center_two_li21">${o.userId}</li>
								<li class="div_main_center_two_li31">${o.username}</li>
								<li class="div_main_center_two_li41">${o.hadNotSignTotal}</li>
								<li class="div_main_center_two_li51" style="background: white;cursor: default;">${o.hadNotUpload}</li>
							</ul>
						</div>
					</c:forEach>
					</div>

					</div>
				</div>
			</div>
		</div>
</body>
</html>
