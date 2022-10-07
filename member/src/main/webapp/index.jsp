<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./header.jsp" %>
<%
	if(session.getAttribute("loginState").equals("login")) { // 로그인
%>
		 <jsp:include page="./login_page.jsp"/>
<%
	} else if (session.getAttribute("loginState").equals("join")) { // 회원가입 버튼을 눌렀을 시
%>		
		<jsp:include page="./register_page.jsp"/>
<%		
	} else { // 로그아웃
%>
		 <jsp:include page="./logout_page.jsp"/>
<%
	}
%>
<%@ include file="./footer.jsp" %>
</body>
</html>