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
	
	function downLoad(studentId, studentName) {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/download")%>" + "?studentId=" + studentId + "&studentName=" + studentName  + "&majorName=" + '${majorName}'+ "&date=" + '${date}';
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

		<div class="center_main" style="top:115px">
			<div class="main_right" style="left:280px;">

				<div class="div_main_center" style="width:800px; overflow: auto;">

					<div class="div_main_center_one">
						<ul style="list-style:none;margin:0px">
							<li class="div_main_center_one_li11">学号</li>
							<li class="div_main_center_one_li21" style="left:230px">姓名</li>
							<li class="div_main_center_one_li31" style="left:230px">签到时间</li>
							<li class="div_main_center_one_li41" style="left:580px; width:100px">上传时间</li>
							<li class="div_main_center_one_li51" style="left:700px; width:100px;">下载</li>
						</ul>
					</div>
					<div class="div_main_center_two">
					<%int i = 1; %>
					<c:forEach items="${signInList}" var="o">
						<div class="div_main_center_two1">
							<ul style="list-style:none;margin:0px;">
								<li class="div_main_center_two_li11"><%=i++%></li>
								<li class="div_main_center_two_li21">${o.studentId}</li>
								<li class="div_main_center_two_li31" style="left:180px" >${o.studentName}</li>
								<c:choose>  
								    <c:when test="${o.signInStatus == 1}">
								    	<li class="div_main_center_two_li41" style="left:355px;width:200px;" >${o.signTime}</li>
								    </c:when>  
								    <c:otherwise>
								    	<li class="div_main_center_two_li41" style="left:355px;width:200px;" >未签到</li>
								    </c:otherwise>  
								</c:choose> 
								<c:choose>  
								    <c:when test="${o.uploadState == 1}">
								    	<li class="div_main_center_two_li41" style="left:550px;width:150px; background: white;cursor: default;">${o.uploadTime}</li>
								    	<li class="div_main_center_two_li31" style="left:726px; width:50px;height:30px" onclick="downLoad('${o.studentId}', '${o.studentName}')">下载</li>
								    </c:when>  
								    <c:otherwise>
								    	<li class="div_main_center_two_li41" style="left:605px;width:50px;height:30px; background: white;cursor: default;">未上传</li>
								    </c:otherwise>  
								</c:choose> 
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
