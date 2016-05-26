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
	function logout() {
		var turnUrl = "<%=PathUtil.getFullPath("user/logout")%>";
		window.location.href = turnUrl;
	}
	
	function runToStudentList() {
		var turnUrl = "<%=PathUtil.getFullPath("admin/studentList")%>";
		window.location.href = turnUrl;
	}
</script>
</head>
<body style="margin:0px;height: 760px;width:100%">
	<div class="warpper">
		<div class="header">
			<a class="header_title">数据结构上机系统</a> <label class="header_logout"  style="cursor: pointer;" onclick="logout()">注销</label>
			<label class="header_login_name">管理员</label> <img
				class="header_img"
				src="<%=PropertyUtil.getStaticUrl()%>/images/ICN_Web_PersonalInformation_25x25.png"></img>
		</div>

		<div class="breadcrumb">
			<div class="breadcrumb_question" style="background:#D2DAE3;cursor: pointer;"
				onclick="runToTeacherList()" >老师管理</div>
			<div class="breadcrumb_task" onclick="runToStudentList()" style="cursor: pointer;">学生管理</div>
			<div class="breadcrumb_sign_in" style="cursor: pointer;" onclick="runToClassList()">班级管理</div>
		</div>

		<div class="center_main">
			<div class="main_left">
				<hr class="main_hr"
					style="width:180px; position:absolute; top:20px;margin:0px" />
				<div class="main_left_elist" onclick="addQuestion()"
					style="cursor: pointer;font-size:18px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #000000;position: absolute;top:21px">添加老师</div>
				<hr style="width:180px; position:absolute; top:50px;margin:0px" />
				<div class="1" onclick="initialColor('1')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#2E4358;font-family:Arial;color: #ffffff;position: absolute;top:51px">老师列表</div>
				<hr style="width:180px; position:absolute; top:80px;margin:0px" />
			</div>

			<hr class="main_hr2" />

			<div class="main_right">
				<div>
					<input class="main_right_search" id="searchContentInput"
						name="searchContentInput" placeholder="Please input the keyword" />
					<img class="search_img" onclick="submitSearchContent()" />
				</div>

				<div class="div_main_center">

					<div class="div_main_center_one">
						<ul style="list-style:none;margin:0px">
							<li class="div_main_center_one_li11">工号</li>
							<li class="div_main_center_one_li21">姓名</li>
							<li class="div_main_center_one_li31">电话</li>
							<li class="div_main_center_one_li41">编辑</li>
						</ul>
					</div>
					<form action="<%=PathUtil.getFullPath("admin/deleteTeacher")%>" method="POST" id="deleteForm">
					<div class="div_main_center_two"  style="overflow: auto">
					<%int i = 1; %>
					<c:forEach items="${teacherList}" var="o">
						<div class="div_main_center_two1">
							<ul style="list-style:none;margin:0px;">
								<li class="div_main_center_two_li11"><%=i++%></li>
								<li class="div_main_center_two_li21">${o.userId}</li>
								<li class="div_main_center_two_li31">${o.username}</li>
								<li class="div_main_center_two_li41">${o.telephone}</li>
								<li class="div_main_center_two_li51" onclick="submitEdit('${o.id}')"></li>
								<li class="div_main_center_two_li6">
								<input type="checkBox" value="${o.id}" name="chkAll" id="chkAll"/></li>
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
