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
	
	function submitSearchContent() {
		var pageSize = ${pagination.pageSize};
		var chapterId = document.getElementById("chapterId").value;
		var searchContent = document.getElementById("searchContentInput").value;
		if (!searchContent) {
			searchContent = "";
		}
		
		var turnUrl = "<%=PathUtil.getFullPath("teacher/questionList")%>" + "?chapterId=" + chapterId + "&pageSize=" + pageSize + "&searchContent=" + searchContent;
		window.location.href = turnUrl;
	}
	
	function initialColor(name) {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/questionList")%>" + "?chapterId=" + name;
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
			<div class="breadcrumb_question"
				onclick="runToQuestionList()">问题列表</div>
			<div class="breadcrumb_task" style="background:#D2DAE3;" onclick="runToDailyTask()">今日任务</div>
			<div class="breadcrumb_sign_in">签到详情</div>
			<div class="breadcrumb_home" onclick="runToPersonalHome()">个人主页</div>
		</div>

		<div class="center_main">
			<div class="main_left">
				<hr style="width:180px; position:absolute; top:50px;margin:0px" />
				<div class="1" onclick="initialColor('1')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#2E4358;font-family:Arial;color: #ffffff;position: absolute;top:51px">
				任务列表</div>
				<hr style="width:180px; position:absolute; top:80px;margin:0px" />
				<div class="2" onclick="initialColor('2')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:81px">
				指定任务</div>
				<hr style="width:180px; position:absolute; top:110px;margin:0px" />
				<div class="3" onclick="initialColor('3')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:111px">
				随机任务</div>
				<hr style="width:180px; position:absolute; top:140px;margin:0px" />
			</div>

			<hr class="main_hr2" />

			<div class="main_right">
				<div class="div_main_task_center1" style="width:100%; height:190px;border:0px solid #2e4358;border-radius: 5px;position:absolute;top:15px;">
					<label >专业班级&nbsp;:</label>
					<select class="chapter_select_major" style="width:173px;height:21px;position: absolute; left:150px;top:0px;" name="options" disabled="disabled">
					<c:forEach items="${majorList}" var="o">
						<option value="${o.id}">${o.name}</option>
					</c:forEach>
					</select>
					
					<label style="width: 100px;height:30px;position: absolute; left:0px;top:60px;">上机时间&nbsp;:</label>
					<input type="date" style="width: 100px;height:30px;position: absolute; left:150px;top:120px;"/>
					<label style="width: 100px;height:30px;position: absolute; left:0px;top:120px;">章节名称&nbsp;:</label>
					<select class="chapter_select_chapter" style="width: 100px;height:30px;position: absolute; left:150px;top:120px;" name="options" disabled="disabled">
					<option value="1"> 绪论</option>
					<option value="2"> 线性表</option>
					<option value="3">栈和队列</option>
					<option value="4">串</option>
					<option value="5">数组和广义表</option>
					<option value="6"> 树和二叉树</option>
					<option value="7"> 图</option>
					<option value="8">动态存储管理</option>
					<option value="9"> 查找</option>
					<option value="10">内存排序</option>
					<option value="11">外部排序</option>
					<option value="12">文件</option>
			</select>
				</div>
				<div class="div_main_task_center2" style="overflow:auto; width:100%; height:350px;border:1px solid #2e4358;border-radius: 5px;position:absolute;top:200px;"> 
					<div class="div_main_center_one">
						<ul style="list-style:none;margin:0px">
							<li class="div_main_center_one_li11"><input type="checkBox" onclick="CheckAll()"/></li>
							<li class="div_main_center_one_li21">ID</li>
							<li class="div_main_center_one_li31">标题</li>
							<li class="div_main_center_one_li41">描述</li>
						</ul>
					</div>
					<form action="<%=PathUtil.getFullPath("teacher/deleteQuestion")%>" method="POST" id="deleteForm">
					<div class="div_main_center_two">
					<%int i = 1; %>
					<c:forEach items="${questionList}" var="o">
						<div class="div_main_center_two1">
							<ul style="list-style:none;margin:0px;">
								<li class="div_main_center_two_li11">
								<input type="checkBox" value="${o.id}" name="chkAll" id="chkAll"/></li>
								<li class="div_main_center_two_li21">Q<fmt:formatNumber type="number" pattern="######" minIntegerDigits="6" value="${o.id}"/></li>
								<li class="div_main_center_two_li31">${o.title}</li>
								<li class="div_main_center_two_li41">${o.description}</li>
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
