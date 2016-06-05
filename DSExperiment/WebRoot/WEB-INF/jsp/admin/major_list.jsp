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
	
	function addMajor() {
		var turnUrl = "<%=PathUtil.getFullPath("admin/addMajorJsp")%>";
		window.location.href = turnUrl;
	}
	
	function submitEdit(id,name) {
		var turnUrl = "<%=PathUtil.getFullPath("admin/editMajorJsp")%>" + "?majorId=" + id + "&majorName=" + name;
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
			<a class="header_title">数据结构上机系统</a> <label class="header_logout"  style="cursor: pointer;" onclick="logout()">注销</label>
			<label class="header_login_name">管理员</label> <img
				class="header_img"
				src="<%=PropertyUtil.getStaticUrl()%>/images/ICN_Web_PersonalInformation_25x25.png"></img>
		</div>

		<div class="breadcrumb">
			<div class="breadcrumb_question" style="cursor: pointer;"
				onclick="runToTeacherList()" >老师管理</div>
			<div class="breadcrumb_task" onclick="runToStudentList()" style="cursor: pointer;">学生管理</div>
			<div class="breadcrumb_sign_in" style="background:#D2DAE3;cursor: pointer;" onclick="runToClassList()">班级管理</div>
		</div>

		<div class="center_main">
			<div class="main_left">
				<hr class="main_hr"
					style="width:180px; position:absolute; top:20px;margin:0px" />
				<div class="main_left_elist" onclick="addMajor()"
					style="cursor: pointer;font-size:18px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #000000;position: absolute;top:21px">添加班级</div>
				<hr style="width:180px; position:absolute; top:50px;margin:0px" />
				<div class="1" onclick="initialColor('1')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#2E4358;font-family:Arial;color: #ffffff;position: absolute;top:51px">班级列表</div>
				<hr style="width:180px; position:absolute; top:80px;margin:0px" />
			</div>

			<hr class="main_hr2" />

			<div class="main_right">
				<div class="div_main_center">

					<div class="div_main_center_one">
						<ul style="list-style:none;margin:0px">
							<li class="div_main_center_one_li11" style="left:100px;width:100px;">班级编号</li>
							<li class="div_main_center_one_li21">班级名</li>
							<li class="div_main_center_one_li41">编辑</li>
						</ul>
					</div>
					<form action="<%=PathUtil.getFullPath("admin/deleteMajor")%>" method="POST" id="deleteForm">
					<div class="div_main_center_two"  style="overflow: auto">
					<%int i = 1; %>
					<c:forEach items="${majorList}" var="o">
						<div class="div_main_center_two1">
							<ul style="list-style:none;margin:0px;">
								<li class="div_main_center_two_li11"><%=i++%></li>
								<li class="div_main_center_two_li21">M<fmt:formatNumber type="number" pattern="######" minIntegerDigits="6" value="${o.id}"/></li>
								<li class="div_main_center_two_li31">${o.name}</li>
								<li class="div_main_center_two_li51" onclick="submitEdit('${o.id}','${o.name }')"></li>
								<li class="div_main_center_two_li6">
								<input type="checkBox" value="${o.id}" name="chkAll" id="chkAll"/></li>
							</ul>
						</div>
					</c:forEach>
					<div style="width: 100%;height:70px;position:absolute;">
						<div class="delete" onclick="deleteQuestions()">删除
					</div>
					</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
