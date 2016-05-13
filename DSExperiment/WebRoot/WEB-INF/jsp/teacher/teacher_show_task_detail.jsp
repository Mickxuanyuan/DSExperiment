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
	window.onload = function() {
		var obj= document.getElementsByTagName("option");
		for(var i=0;i<obj.length;i++) {
			if(obj[i].value=='${chapterId}' && obj[i].id=='chapter') {
				obj[i].selected=true;
			}
		}
		
		for(var i=0;i<obj.length;i++) {
			if(obj[i].value=='${major}' && obj[i].id=='major') {
				obj[i].selected=true;
			}
		}
	};

	function submitPageSize() {
		var pageSize = document.getElementById("pageSize").value;
		var chapterId = document.getElementById("chapterId").value;
		var searchContent = document.getElementById("searchContent");

		if (!searchContent) {
			searchContent = "";
		} else {
			searchContent = searchContent.value;
		}
		var turnUrl = "<%=PathUtil.getFullPath("teacher/questionList")%>" + "?chapterId=" + chapterId + "&pageSize=" + pageSize + "&searchContent=" + searchContent;
		window.location.href = turnUrl;
		
	}
	
	function runToQuestionList() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/questionList")%>";
		window.location.href = turnUrl;
	}
	
	function runToDailyTask() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/dailyTask")%>";
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
	
	function runToRandomTask() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/addRandomTaskJsp")%>";
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

	function deleteQuestions() {
		var deleteFormObj = document.getElementById("deleteForm");
		deleteFormObj.submit();
	}
	
	function submitChapterInfo() {
		var major = document.getElementById("major").value;
		var date = document.getElementById("setUpDate").value;
		var chapterId = document.getElementById("chapterId").value;
		var turnUrl = "<%=PathUtil.getFullPath("teacher/addTaskJsp")%>" + "?major=" + major + "&date=" + date + "&chapterId=" + chapterId;;
		window.location.href = turnUrl;
	}
	
	function submitForm() {
		 var addTaskFormObj = document.getElementById("addTaskForm");
		 addTaskFormObj.submit();
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

		<div class="main_center">
		
			<div class="main_center_top">
				<label>任务发布&nbsp;--</label><label class="edit_question_id_l">任务详情&nbsp;--</label><label class="edit_question_id">T<fmt:formatNumber type="number" pattern="######" minIntegerDigits="6" value="${task.id}"/></label>
			</div>
			<div class="main_right" style="top:60px;left:250px">
			<form action="<%=PathUtil.getFullPath("teacher/addTaskPage")%>" method="POST" id="addTaskForm">
				<div class="div_main_task_center2" style="overflow:auto; width:800px; height:430px;border:1px solid #2e4358;border-radius: 5px;position:absolute;top:30px;"> 
					<div class="div_main_center_one">
						<ul style="list-style:none;margin:0px">
							<li class="div_main_center_one_li01" >学号</li>
							<li class="div_main_center_one_li11" style="left:200px">姓名</li>
							<li class="div_main_center_one_li21" style="left:500px">问题详情</li>
						</ul>
					</div>
					
					<div class="div_main_center_two">
					<%int i = 1; %>
					<c:forEach items="${questionList}" var="o">
						<div class="div_main_center_two1">
							<ul style="list-style:none;margin:0px;">
								<li class="div_main_center_two_li11">T<fmt:formatNumber type="number" pattern="######" minIntegerDigits="6" value="${o.id}"/></li>
								<li class="div_main_center_two_li21" style="left:200px">123</li>
								<li class="div_main_center_two_li31" style="left:500px">456</li>
							</ul>
						</div>
					</c:forEach>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
