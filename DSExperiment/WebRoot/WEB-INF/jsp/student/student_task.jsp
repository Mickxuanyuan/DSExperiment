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
<title>今日任务</title>
<link href="<%=PropertyUtil.getStaticUrl()%>/style/student_home.css"
	rel="stylesheet" type="text/css">

<script>
function runToQuestionList() {
	var turnUrl = "<%=PathUtil.getFullPath("student/questionList")%>";
	window.location.href = turnUrl;
}

function runToDailyTask() {
	var turnUrl = "<%=PathUtil.getFullPath("student/dailyTask")%>";
	window.location.href = turnUrl;
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
			<div class="breadcrumb_question" onclick="runToQuestionList()">问题列表</div>
			<div class="breadcrumb_task" onclick="runToDailyTask()" style="background:#D2DAE3">今日任务</div>
			<div class="breadcrumb_home">个人主页</div>
		</div>

		<div class="center_main">
			<div style="width: 100px;height: 50px; position: absolute; left:50px;top:60px;background:#ffffff;border-radius: 5px;">
				<c:if test="${signInStatus == '0'}">
				<a href="<%=PathUtil.getFullPath("student/signIn")%>" onclick="alert('签到成功')" class="header_sign_in" style="top: 20px; position: absolute;font-family:Arial; font-size:14px; color:#FFFFFF" >
					 <img src="<%=PropertyUtil.getStaticUrl()%>/images/sign_in.png"/>
					 <label style="width:50px;height:20px; absolute; left:10px;top:0px;font-family:Arial; font-size:20px; color:#000000">签到</label>
				</a>
				</c:if>
				<c:if test="${signInStatus == '1'}">
				<a class="header_sign_in" style="width:100px;height:60px;top: 20px; position: absolute;font-family:Arial; font-size:14px; color:#FFFFFF" >
					 <img src="<%=PropertyUtil.getStaticUrl()%>/images/sign_in.png"/>
					 <label style="width:80px;height:60px; absolute; left:0px;top:0px;font-family:Arial; font-size:20px; color:#000000">已签到</label>
				</a>
				</c:if>
			</div>
			<hr class="main_hr2"/>
			<div class="center_main2"
				style="border: 1px solid #2e4358; width: 900px;height: 400px; position: absolute; left:350px;top:30px;background:#ffffff;border-radius: 5px;overflow:auto">
				<c:forEach items="${questionList}" var="o">
				<div style="width: 700px;height: 400px">
					<label style="position:absolute; left:20px; font-family:Arial; font-size:20px;">Q<fmt:formatNumber type="number" pattern="######" minIntegerDigits="6" value="${o.id}"/></label><br/>
					<br/><label style="position:absolute; left:20px; font-family:Arial; font-size:20px;">题目标题:${o.title}</label><br/><br/> 
					<label style="position:absolute; left:20px; font-family:Arial; font-size:20px;">题目描述:</label>
					<textarea style="font-family:Arial; font-size:15px;position:absolute; left:110px; width:600px; height:200px;overflow-y:auto;resize: none" disabled="disabled">${o.description}
					</textarea>
				</div>
				</c:forEach>
				<br/>
			</div>
		</div>
	</div>
</body>
</html>
