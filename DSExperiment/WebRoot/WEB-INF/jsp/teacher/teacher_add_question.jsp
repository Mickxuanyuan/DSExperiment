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
<title>添加问题</title>
<link href="<%=PropertyUtil.getStaticUrl()%>/style/student_home.css" rel="stylesheet" type="text/css">
<link href="<%=PropertyUtil.getStaticUrl()%>/style/teacher_home.css" rel="stylesheet" type="text/css">
<script>
function submitCancel() {
	var turnUrl = "<%=PathUtil.getFullPath("teacher/questionList")%>";
	window.location.href = turnUrl;
}

function submitForm() {
	var editFormObj = document.getElementById("editForm");
	var questionTitleObj = document.getElementById("questionTitle");
	var questionDescriptionObj = document.getElementById("questionDescription");
	var isSubmitForm = true;
	alert(questionTitleObj.value);
	 if (!questionTitleObj.value) {
		 questionTitleObj.style.border="1px dashed #EB340A";
         isSubmitForm = false;
     } else {
    	 questionTitleObj.style.cssText = "border: 1px solid #858585;";
     }
	 
	 if (!questionDescriptionObj.value) {
		 questionDescriptionObj.style.border="1px dashed #EB340A";
         isSubmitForm = false;
     } else {
    	 questionDescriptionObj.style.cssText = "border: 0px solid #858585;";
     }

     if (isSubmitForm) {
    	 editFormObj.submit();
    	 alert('保存成功');
     }
	
     function logout() {
 		var turnUrl = "<%=PathUtil.getFullPath("user/logout")%>";
 		window.location.href = turnUrl;
 	}
}
</script>

</head>
  <body style="margin:0px;height: 760px;width:100%">
	<div class="warpper">
	
		<div class="header">
			<a class="header_title">数据结构上机系统</a>
			<label class="header_logout" style="cursor: pointer;"  style="cursor: pointer;" onclick="logout()">注销</label>
			<label class="header_login_name">${user.username}</label>
			<img class="header_img" src="<%=PropertyUtil.getStaticUrl()%>/images/ICN_Web_PersonalInformation_25x25.png"></img>
		</div>
		<div class="main_center">
		<div class="main_center_top">
			<label>问题列表&nbsp;--</label><label class="edit_question_id_l">问题编辑&nbsp;--</label>
		</div>
		<form  action="<%=PathUtil.getFullPath("teacher/submitAddQuestion")%>" method="POST" id="editForm">
		<div class="center_question">
			<label >章节名称&nbsp;:</label>
			<select class="chapter_select" name="options">
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
			<label  class="edit_question_center_title_l" >问题标题&nbsp;:</label>
			<input class="edit_question_center_title" id="questionTitle" name="questionTitle"></input>
			<label class="edit_question_center_discription_l" >问题描述&nbsp;:</label>
			<textarea class="edit_question_center_ds" id="questionDescription" name="questionDescription"></textarea>
			<div class="button_sure" onclick="submitForm()">确认</div>
			<div class="button_cancel" onclick="submitCancel()">返回</div>
		</div>
		</form>
		</div>
	</div>
  </body>
</html>
