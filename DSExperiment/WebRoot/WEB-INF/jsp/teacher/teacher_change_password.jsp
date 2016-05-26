<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hpu.fyx.utils.PropertyUtil" %>
<%@ page import="com.hpu.fyx.utils.PathUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.hpu.fyx.common.Constants" %>

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
	
	function runToPersonInfo() {
		var turnUrl = "<%=PathUtil.getFullPath("teacher/info")%>";
		window.location.href = turnUrl;
	}
	
	 function submitForm() {
	      var changePasswordObj = document.getElementById("changePasswordForm");
	      
	      var isSubmitForm = true;
	      var passwordObj = document.getElementById("password");
	      var passwordValue = passwordObj.value;
	      var newPasswordObj = document.getElementById("newPassword");
	      var newPasswordValue = newPasswordObj.value;
	      
	      var errorMsg = "";
	      var errorMsgObj = document.getElementById("errorMsg");
	      
	      var reNewPasswordObj = document.getElementById("reNewPassword");
	      var reNewPasswordValue = reNewPasswordObj.value;
	      var newPasswordNull = false;
	      var reNewPasswordNull = false;
	      
	      if (!passwordValue.trim()) {
	          errorMsg = "请输入原密码";
	          isSubmitForm = false;
	          passwordObj.style.border="1px dashed #EB340A";
	      } else {
	    	  passwordObj.style.cssText = "border: 1px solid #858585;width:178px;height:25px;position: absolute; left:150px;top:0px;";
	      }
	      
	      if (!newPasswordValue.trim()) {
	    	  newPasswordNull = true;
	          errorMsg = "请输入新密码";
	          isSubmitForm = false;
	          newPasswordObj.style.border="1px dashed #EB340A";
	      } else {
	    	  newPasswordObj.style.cssText = "border: 1px solid #858585;width:178px;height:25px;position: absolute; left:150px;top:60px;";
	      }
	      
	      if (!reNewPasswordValue.trim()) {
	    	  reNewPasswordNull = true;
	          errorMsg = "请输入确认密码";
	          reNewPasswordObj.style.border="1px dashed #EB340A";
	          isSubmitForm = false;
	      } else {
	    	  reNewPasswordObj.style.cssText = "border: 1px solid #858585;width:178px;height:25px;position: absolute; left:150px;top:120px;";
	      }
	      
	      if ((newPasswordValue.trim() != reNewPasswordValue.trim())) {
	    	  newPasswordNull = true;
	          errorMsg = "两次输入不一致";
	          isSubmitForm = false;
	          newPasswordObj.style.border="1px dashed #EB340A";
	          reNewPasswordObj.style.border="1px dashed #EB340A";
	      } else {
	    	  newPasswordObj.style.cssText = "border: 1px solid #858585;width:178px;height:25px;position: absolute; left:150px;top:60px;";
	    	  reNewPasswordObj.style.cssText = "border: 1px solid #858585;width:178px;height:25px;position: absolute; left:150px;top:120px;";
	      }
	      
	      if (newPasswordNull && reNewPasswordNull) {
	          errorMsg = "请输入密码和确认密码";
	      }
	      
	      if (!isSubmitForm) {
	          errorMsgObj.innerHTML = errorMsg;
	          errorMsgObj.style.visibility="visible";
	      }
	      
	      if (isSubmitForm) {
	    	  changePasswordObj.submit();
	      }
	  }
</script>
</head>
<body style="margin:0px;height: 760px;width:100%">
	<div class="warpper">
		<%
			String tipMessage = (String) request.getAttribute(Constants.TIP_MESSAGE);
			String visibility = "hidden";
			if (tipMessage != null && !tipMessage.equals("")) {
				visibility = "visible";
			}
		%>

		<div class="header">
			<a class="header_title">数据结构上机系统</a>
			<label class="header_logout" style="cursor: pointer;" onclick="logout()">注销</label>
			<label class="header_login_name">${user.username}</label>
			<img class="header_img" src="<%=PropertyUtil.getStaticUrl()%>/images/ICN_Web_PersonalInformation_25x25.png"></img>
		</div>
		
		<div class="breadcrumb">
			<div class="breadcrumb_question" 
				onclick="runToQuestionList()" style="cursor: pointer;">问题列表</div>
			<div class="breadcrumb_task" onclick="runToDailyTask()" style="cursor: pointer;">发布任务</div>
			<div class="breadcrumb_sign_in" style="cursor: pointer;" onclick="runToSignInDetail()">签到详情</div>
			<div class="breadcrumb_total" onclick="runToTotal()" style="cursor: pointer;">签到总结</div>
			<div class="breadcrumb_home" onclick="runToPersonalHome()" style="background:#D2DAE3;cursor: pointer;">个人主页</div>
		</div>
		
		<div class="center_main">
		
			<div class="main_left">
				<hr style="width:180px; position:absolute; top:50px;margin:0px" />
				<div class="1" onclick="runToPersonInfo()" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:51px">个人信息</div>
				<hr style="width:180px; position:absolute; top:80px;margin:0px" />
				<div class="2" onclick="initialColor('2')" style="cursor: pointer;font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#2E4358;font-family:Arial;color: #ffffff;position: absolute;top:81px">修改密码</div>
				<hr style="width:180px; position:absolute; top:110px;margin:0px" />
			</div>
			
			<hr class="main_hr2"/>
			
			<div class="main_right">
				<form action="<%=PathUtil.getFullPath("user/changePwdAction")%>" name="changePasswordForm" id="changePasswordForm" method="post" >
				<div class="div_main_center" style="width:300px;left:300px;border:none;">
					<label >原密码&nbsp;:</label>
					<input class="chapter_select_major" name="password" id="password" type="text" style="width:178px;height:25px;position: absolute; left:150px;top:0px;"/>
					
					<label style="width: 100px;height:30px;position: absolute; left:0px;top:60px;">新密码&nbsp;:</label>
					<input class="chapter_select_question_number" name="newPassword" id="newPassword" type="text" style="width:178px;height:25px;position: absolute; left:150px;top:60px;" />
					
					<label style="width: 100px;height:30px;position: absolute; left:0px;top:120px;">确认密码&nbsp;:</label>
					<input class="chapter_select_question_number" name="reNewPassword" id="reNewPassword" type="text" style="width:178px;height:25px;position: absolute; left:150px;top:120px;" />
					<div id="errorMsg" class="line" style="margin-top: 150px; visibility: <%=visibility %>;color: red;font-size: 14px;">
            		<%=tipMessage %>
         			</div>
					<div class="button_sure" style="top:300px" onclick="submitForm()">提交</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
