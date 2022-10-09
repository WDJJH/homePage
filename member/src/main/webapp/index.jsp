<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/member/css/greeting.css">
<title>테스트</title>
</head>
<body>
<%
	if(session.isNew()){
		session.setAttribute("loginState", "logout");
		session.setAttribute("userid", null);
		session.setAttribute("userpw", null);
		session.setAttribute("IDcheck", "null");
		session.setAttribute("Name", null);
		session.setAttribute("Id", null);
		session.setAttribute("Passwd", null);
		session.setAttribute("Email", null);
		session.setAttribute("Phone", null);
		session.setAttribute("RRN", null);
		session.setAttribute("Class", null);
	}
%>

<%
	// 로그인 상태, 바로 login_page로 이동
	if(session.getAttribute("loginState").equals("login")) {
%>
		 <jsp:forward page="./index2.jsp"/>
<%
	} else if (session.getAttribute("loginState").equals("join")) {
	} else {	
%>
	<div class="container">
		<h1>회원 관리 시스템 v1. 0</h1>
		<div id="logo">
			<img src="/member/images/Feedback_logo_line.png" width="45%" height=""/>
		</div>
		<div id="login">
			<form name="login" method="post" action="/member/mem_models/member_dao.jsp">
			<div class="login_form">
				<div class="login">
					<label for="userid">아이디</label>
					<input type="text" name="userid" id="userid" size="20" placeholder="ID" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디를 입력해주세요!'"/>
				</div>
				<div class="login">
					<label for="passwd">비밀번호</label>
					<input type="password" name="passwd" id="passwd" size="20" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호를 입력해주세요!'"/>
				</div>
			</div>
				<input type="hidden" name="actionType" value="LOGIN">
				<input type="submit" class="btn" value="로그인">
			</form>
			<form id="register" name="register" method = "post" action="/member/mem_models/member_dao.jsp">
				<input type="hidden" name="actionType" value="GR">
				<input type="button" class="join_btn" value="아직 회원이 아니신가요?" onclick = "location.href = '/member/join.jsp'">
			</form>
		</div>
		<br/>
	
<%
		if(session.getAttribute("loginState").equals("errorID")){
			out.print("ID를 확인해주세요.");
		}
				
		if(session.getAttribute("loginState").equals("errorPW")){
			out.print("비밀번호를 잘못 입력하셨습니다.");
		}
%>

<%
	}
%>
	</div>
</body>
</html>