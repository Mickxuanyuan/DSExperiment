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
		 var addTaskFormObj = document.getElementById("addRandomTaskForm");
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
				<div class="1" onclick="runToTaskList()" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:51px">
				任务列表</div>
				<hr style="width:180px; position:absolute; top:80px;margin:0px" />
				<div class="2" onclick="runToAddTask()" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:81px">
				指定任务</div>
				<hr style="width:180px; position:absolute; top:110px;margin:0px" />
				<div class="3" onclick="runToRandomTask()" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#2e4358;font-family:Arial;color: #ffffff;position: absolute;top:111px">
				随机任务</div>
				<hr style="width:180px; position:absolute; top:140px;margin:0px" />
			</div>

			<hr class="main_hr2" />
			<div class="main_right">
			<form action="<%=PathUtil.getFullPath("teacher/addRandomTask")%>" method="GET" id="addRandomTaskForm">
				<div class="div_main_task_center1" style="width:100%; height:190px;border:0px solid #2e4358;border-radius: 5px;position:absolute;top:15px;">
					<label >专业班级&nbsp;:</label>
					<select class="chapter_select_major" name="major" id="major" style="width:178px;height:25px;position: absolute; left:150px;top:0px;">
					<c:forEach items="${majorList}" var="o">
						<option value="${o.id}" id="major">${o.name}</option>
					</c:forEach>
					</select>
					
					<label style="width: 100px;height:30px;position: absolute; left:400px;top:0px;">上机时间&nbsp;:</label>
					<input type="date" name="setUpDate" value="${date}" id="setUpDate" value="2016-06-06" style="width: 173px;height:21px;position: absolute; left:550px;top:0px;"/>
					<label style="width: 100px;height:30px;position: absolute; left:0px;top:60px;">章节名称&nbsp;:</label>
					<select name="chapterId" id="chapterId" class="chapter_select_chapter" style="width:178px;height:25px;position: absolute; left:150px;top:60px;" >
					<option value="1" id="chapter"> 绪论</option>
					<option value="2" id="chapter"> 线性表</option>
					<option value="3" id="chapter">栈和队列</option>
					<option value="4" id="chapter">串</option>
					<option value="5" id="chapter">数组和广义表</option>
					<option value="6" id="chapter"> 树和二叉树</option>
					<option value="7" id="chapter"> 图</option>
					<option value="8" id="chapter">动态存储管理</option>
					<option value="9" id="chapter"> 查找</option>
					<option value="10" id="chapter">内存排序</option>
					<option value="11" id="chapter">外部排序</option>
					<option value="12" id="chapter">文件</option>
					</select>
					
					<label style="width: 100px;height:30px;position: absolute; left:400px;top:60px;">任务题量&nbsp;:</label>
					<select name="questionNumber" id="questionNumber" class="chapter_select_question_number" style="width:178px;height:25px;position: absolute; left:550px;top:60px;" >
					<option value="1" id="chapter"> 1</option>
					<option value="2" id="chapter"> 2</option>
					<option value="3" id="chapter"> 3</option>
					<option value="4" id="chapter"> 4</option>
					<option value="5" id="chapter"> 5</option>
					<option value="6" id="chapter"> 6</option>
					</select>
				</div>
				</form>
				<div class="button_sure" style="left:290px; top:300px;" onclick="submitForm()">提交</div>
			</div>
		</div>
	</div>
</body>
</html>
