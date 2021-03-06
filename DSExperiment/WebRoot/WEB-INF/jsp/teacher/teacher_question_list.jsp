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
	
	window.onload = function() {
		var breadcrumbDiv = document.getElementsByTagName("div");
		var chapterId = ${pagination.chapterId};
		for (var i = 0; i < breadcrumbDiv.length; i++) {

			if (breadcrumbDiv[i].className == "main_left") {
				var breadcrumbDivChild = breadcrumbDiv[i].getElementsByTagName("div");

				for (i = 0; i < breadcrumbDivChild.length; i++) {
					if (breadcrumbDivChild[i].className != chapterId) {
						breadcrumbDivChild[i].style.color = "#2E4358";
						breadcrumbDivChild[i].style.background = "#ffffff";
					} else {
						breadcrumbDivChild[i].style.color = "#ffffff";
						breadcrumbDivChild[i].style.background = "#2E4358";
					}
				}
			}
		}
		
		var all_options = document.getElementById("pageSize").options;
		for (i = 0; i < all_options.length; i++) {
			if (all_options[i].value == ${pagination.pageSize})
			{
				
				all_options[i].selected = true;
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
	
	function submitPageNumber() {
		var pageNumber = document.getElementById("goCurrentPage").value;
		if (!pageNumber) {
			pageNumber = 1;
		}
		
		if (pageNumber > ${pagination.totalPage}) {
			pageNumber = ${pagination.totalPage};
		}
		
		var pageSize = ${pagination.pageSize};
		var chapterId = document.getElementById("chapterId").value;
		var searchContent = document.getElementById("searchContent");

		if (!searchContent) {
			searchContent = "";
		} else {
			searchContent = searchContent.value;
		}
		var turnUrl = "<%=PathUtil.getFullPath("teacher/questionList")%>" + "?chapterId=" + chapterId + "&pageSize=" + pageSize + "&searchContent=" + searchContent + "&currentPage=" + pageNumber;
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
	
	function runToTotal () {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/signInTotal")%>";
		window.location.href = turnUrl;
	}
	
	function runToPersonalInfo() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/info")%>";
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
			<div class="breadcrumb_question" style="background:#D2DAE3;cursor: pointer;"
				onclick="runToQuestionList()" >问题列表</div>
			<div class="breadcrumb_task" onclick="runToDailyTask()" style="cursor: pointer;">发布任务</div>
			<div class="breadcrumb_sign_in" style="cursor: pointer;" onclick="runToSignInDetail()">签到详情</div>
			<div class="breadcrumb_total" onclick="runToTotal()" style="cursor: pointer;">签到总结</div>
			<div class="breadcrumb_home" onclick="runToPersonalInfo()" style="cursor: pointer;">个人主页</div>
		</div>

		<div class="center_main">
			<div class="main_left">
				<hr class="main_hr"
					style="width:180px; position:absolute; top:20px;margin:0px" />
				<div class="main_left_elist" onclick="addQuestion()"
					style="cursor: pointer;font-size:18px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #000000;position: absolute;top:21px">创建问题</div>
				<hr style="width:180px; position:absolute; top:50px;margin:0px" />
				<div class="1" onclick="initialColor('1')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#2E4358;font-family:Arial;color: #ffffff;position: absolute;top:51px">第
					1 章 绪论</div>
				<hr style="width:180px; position:absolute; top:80px;margin:0px" />
				<div class="2" onclick="initialColor('2')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:81px">第
					2 章 线性表</div>
				<hr style="width:180px; position:absolute; top:110px;margin:0px" />
				<div class="3" onclick="initialColor('3')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:111px">第
					3 章 栈和队列</div>
				<hr style="width:180px; position:absolute; top:140px;margin:0px" />
				<div class="4" onclick="initialColor('4')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:141px">第
					4 章 串</div>
				<hr style="width:180px; position:absolute; top:170px;margin:0px" />
				<div class="5" onclick="initialColor('5')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:171px">第
					5 章 数组和广义表</div>
				<hr style="width:180px; position:absolute; top:200px;margin:0px" />
				<div class="6" onclick="initialColor('6')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:201px">第
					6 章 树和二叉树</div>
				<hr style="width:180px; position:absolute; top:230px;margin:0px" />
				<div class="7" onclick="initialColor('7')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:231px">第
					7 章 图</div>
				<hr style="width:180px; position:absolute; top:260px;margin:0px" />
				<div class="8" onclick="initialColor('8')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:261px">第
					8 章 动态存储管理</div>
				<hr style="width:180px; position:absolute; top:290px;margin:0px" />
				<div class="9" onclick="initialColor('9')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:291px">第
					9 章 查找</div>
				<hr style="width:180px; position:absolute; top:320px;margin:0px" />
				<div class="10" onclick="initialColor('10')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:321px">第
					10 章 内存排序</div>
				<hr style="width:180px; position:absolute; top:350px;margin:0px" />
				<div class="11" onclick="initialColor('11')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:351px">第
					11 章 外部排序</div>
				<hr style="width:180px; position:absolute; top:380px;margin:0px" />
				<div class="12" onclick="initialColor('12')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:381px">第
					12 章 文件</div>
				<hr style="width:180px; position:absolute; top:410px;margin:0px" />
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
							<li class="div_main_center_one_li11">ID</li>
							<li class="div_main_center_one_li21">标题</li>
							<li class="div_main_center_one_li31">描述</li>
							<li class="div_main_center_one_li41">编辑</li>
							<li class="div_main_center_one_li51"><input type="checkBox" onclick="CheckAll()"/></li>
						</ul>
					</div>
					<form action="<%=PathUtil.getFullPath("teacher/deleteQuestion")%>" method="POST" id="deleteForm">
					<div class="div_main_center_two"  style="overflow: auto">
					<%int i = 1; %>
					<c:forEach items="${pagination.record}" var="o">
						<div class="div_main_center_two1">
							<ul style="list-style:none;margin:0px;">
								<li class="div_main_center_two_li11"><%=i++%></li>
								<li class="div_main_center_two_li21">Q<fmt:formatNumber type="number" pattern="######" minIntegerDigits="6" value="${o.id}"/></li>
								<li class="div_main_center_two_li31"  onclick="submitDetail('${o.id}')">${o.title}</li>
								<li class="div_main_center_two_li41">${o.description}</li>
								<li class="div_main_center_two_li51" onclick="submitEdit('${o.id}')"></li>
								<li class="div_main_center_two_li6">
								<input type="checkBox" value="${o.id}" name="chkAll" id="chkAll"/></li>
							</ul>
						</div>
					</c:forEach>
					</div>
					</form>

					<div style="width: 100%;height:70px;position:absolute;">
						<div class="delete" onclick="deleteQuestions()">删除</div>
						<input class="footer_input"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							id="goCurrentPage" name="goCurrentPage" /> <input
							name="searchContent" type="text" class="page_button"
							style="visibility: hidden" value="${pagination.searchContent}" />

						<input type="button" class="footer_img2" value="GO"
							style="color:#F6D238; font-size:5px;padding:0px; width:25px;height:25px;position:absolute;right: 340px;top: 32px;"
							onclick="submitPageNumber()" /> <label class="footer_label">/&nbsp;页</label>

						<select class="footer_select" name="pageSize" id="pageSize"
							onchange="submitPageSize()">
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="5">5</option>
						</select> <input name="chapterId" id="chapterId" type="text"
							style="visibility: hidden" value="${pagination.chapterId}" /> <a
							href="<%=PathUtil.getFullPath("teacher/questionList")%>?currentPage=${pagination.currentPage+1>pagination.totalPage?pagination.totalPage:pagination.currentPage+1}&chapterId=${pagination.chapterId}&pageSize=${pagination.pageSize}&searchContent=${pagination.searchContent}">
							<img class="footer_img3"
							src="<%=PropertyUtil.getStaticUrl()%>/images/BTN_PageRight_20x15.png" />
						</a> <label class="footer_label2">${pagination.currentPage}/${pagination.totalPage}</label>
						<a
							href="<%=PathUtil.getFullPath("teacher/questionList")%>?currentPage=${pagination.currentPage-1>0?pagination.currentPage-1:1}&chapterId=${pagination.chapterId}&pageSize=${pagination.pageSize}&searchContent=${pagination.searchContent}">
							<img class="footer_img4"
							src="<%=PropertyUtil.getStaticUrl()%>/images/BTN_PageLeft_20x15.png" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
