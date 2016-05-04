<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.hpu.fyx.common.Constants" %>
<%@ page import="com.hpu.fyx.utils.PathUtil" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <link href="<%=request.getContextPath() %>/static/style/reset.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath() %>/static/style/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/common.js"></script>
  </head>
  
  <style>
  .errorMessage {
     color: red;
  }
  </style>
  
  <script>
  function login() {
      var loginFormObj = document.getElementById("loginForm");
      
      var isSubmitForm = true;
      
      var userNameObj = document.getElementById("userName");
      var userNameValue = userNameObj.value;
      
      var errorMsg = "";
      var errorMsgObj = document.getElementById("errorMsg");
      
      var userNameIsNull = false;
      var passwordIsNull = false;
      
      if (!userNameValue.trim()) {
          userNameIsNull = true;
          errorMsg = "请输入学工号";
          isSubmitForm = false;
          userNameObj.style.border="1px dashed #EB340A";
      } else {
    	  userNameObj.style.cssText = "border: 1px solid #858585;";
      }
      
      var passwordObj = document.getElementById("password");
      var passwordValue = passwordObj.value;
      if (!passwordValue.trim()) {
          passwordIsNull = true;
          errorMsg = "请输入密码";
          passwordObj.style.border="1px dashed #EB340A";
          isSubmitForm = false;
      } else {
    	  passwordObj.style.cssText = "border: 1px solid #858585;";
      }
      
      if (userNameIsNull && passwordIsNull) {
          errorMsg = "请输入学工号和密码";
      }
      
      if (!isSubmitForm) {
          errorMsgObj.innerHTML = errorMsg;
          errorMsgObj.style.visibility="visible";
      }
      
      if (isSubmitForm) {
         loginFormObj.submit();
      }
  }
  </script>
  <body>
  <%String tipMessage = (String)request.getAttribute(Constants.TIP_MESSAGE);
  String visibility = "hidden";
  if (tipMessage != null && !tipMessage.equals("")) {
      visibility = "visible";
  }
  
  %>
    <div class="login_title"></div>
    
    <div class="login_form">
        <div class="logo"></div>
        <div class="logo_title">河南理工大学</div>
        <div class="title">数据结构上机系统</div>
        
	    <form action="<%=PathUtil.getFullPath("user/login")%>" method="POST" id="loginForm">
	       <div class="line">
	          <label>学工号</label>
	           <input type="text" name="userName" id="userName"/>
	      </div>
	      
	      <div class="line" style="margin-top: 20px;">
              <label>密码</label>
              <input type="password" name="password" id="password"/>
          </div>
	      
	      <div id="errorMsg" class="line" style="margin-top: 10px; visibility: <%=visibility %>;color: red;font-size: 14px;">
            <%=tipMessage %>
          </div>
	     
	       <div class="button" onclick="login()">登陆</div>
	    </form>
    </div>
  </body>
</html>