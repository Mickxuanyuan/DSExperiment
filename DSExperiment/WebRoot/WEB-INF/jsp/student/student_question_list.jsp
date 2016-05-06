<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>welcome</title>
<link href="<%=request.getContextPath() %>/static/style/student_home.css" rel="stylesheet" type="text/css">
</head>
<body style="margin:0px;height: 760px;width:100%">
	<div class="warpper">
	
		<div class=header>
			<a class="header_title">数据结构上机系统</a>
			<label class="header_logout">注销</label>
			<label class="header_login_name">符宇轩</label>
			<img class="header_img" src="ICN_Web_PersonalInformation_25x25.png"></img>
		</div>
		
		<div class="breadcrumb">
			<div class="breadcrumb_question">问题列表</div>
			<div class="breadcrumb_task">今日任务</div>
			<div class="breadcrumb_home">主页</div>
		</div>
		
		<div class="center_main">
		
			<div class="main_left">
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#2E4358;font-family:Arial;color: #ffffff;position: absolute;top:50px">第
					1 章 绪论</div>
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:80px">第
					2 章 线性表</div>
				<hr style="width:180px; position:absolute; top:110px;margin:0px" />
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:111px">第
					3 章 栈和队列</div>
				<hr style="width:180px; position:absolute; top:140px;margin:0px" />
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:141px">第
					4 章 串</div>
				<hr style="width:180px; position:absolute; top:170px;margin:0px" />
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:171px">第
					5 章 数组和广义表</div>
				<hr style="width:180px; position:absolute; top:200px;margin:0px" />
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:201px">第
					6 章 树和二叉树</div>
				<hr style="width:180px; position:absolute; top:230px;margin:0px" />
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:231px">第
					7 章 图</div>
				<hr style="width:180px; position:absolute; top:260px;margin:0px" />
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:261px">第
					8 章 动态存储管理</div>
				<hr style="width:180px; position:absolute; top:290px;margin:0px" />
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:291px">第
					9 章 查找</div>
				<hr style="width:180px; position:absolute; top:320px;margin:0px" />
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:321px">第
					10 章 内存排序</div>
				<hr style="width:180px; position:absolute; top:350px;margin:0px" />
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:351px">第
					11 章 外部排序</div>
				<hr style="width:180px; position:absolute; top:380px;margin:0px" />
				<div style="font-size:14px; width:180px; text-align:center; height:30px; line-height:30px;background:#ffffff;font-family:Arial;color: #2e4358;position: absolute;top:381px">第
					12 章 文件</div>
				<hr style="width:180px; position:absolute; top:410px;margin:0px" />
			</div>
			
			<hr class="main_hr2"/>
			
			<div class="main_right">
			
				<div>
					<input class="main_right_search"
						placeholder="Please input the keyword"/>
					<div class="search_img"></div>
				</div>
				
				<div class="div_main_center">
				
					<div class="div_main_center_one">
						<ul style="list-style:none;margin:0px">
							<li class="div_main_center_one_li1">ID</li>
							<li class="div_main_center_one_li2">标题</li>
							<li class="div_main_center_one_li3">描述</li>
						</ul>
					</div>
					
					<div class="div_main_center_two">
						<div class="div_main_center_two1">
							<ul style="list-style:none;margin:0px;">
								<li class="div_main_center_two_li1">1</li>
								<li class="div_main_center_two_li2">Q000001</li>
								<li class="div_main_center_two_li3">Do you know what is the most beautiful</li>
								<li class="div_main_center_two_li4">Do good thing?Do you know what is the most beautiful and good thing?</li>
							</ul>
						</div>
					</div>
					
					<div style="width: 100%;height:70px;position:absolute;">
						<img class="footer_img2" src="BTN_Go_20x15.png"/>
						
						<form method="GET" action="./QuestionServlet.action" id="submitNumForm">
							<input onkeyup="value=value.replace(/[^\d]/g,'')" onkeydown="changeNumber()"
								style="visibility: hidden" id="pageNum" name="pageNum">
								
							<input name="searchContent" type="text" class="page_button"
								style="visibility: hidden" value="${pageDetail.searchContent}" />
								
							<input type="image" class="footer_img2"
								style="width:20px;height:15px;position:absolute;right: 340px;top: 35px;background:url(BTN_Go_20x15.png  .png)"
								onclick="submitPageNumber(${pageDetail.totalPage})" />
						</form>
						
						<input class="footer_input"/>
						<label class="footer_label">/页</label>
						<select class="footer_select">
							<option selected>10</option>
							<option>5</option>
						</select> 
						<a href="#">
							<img class="footer_img3" src="BTN_PageRight_20x15.png"/>
						</a> 
						<label class="footer_label2">1/2</label>
						<img class="footer_img4" src="BTN_PageLeft_20x15.png"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
