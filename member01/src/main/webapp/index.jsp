<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./header.jsp" %>				<!-- 코드 가져오기 -->
<%
	if(session.getAttribute("loginState").equals("login")){
%>
		 <jsp:include page="./login_page.jsp"/>			<!-- 실행결과 가져오기 -->
<%
	} else if(session.getAttribute("loginState").equals("Next")) {
%>
		<jsp:include page="./join_page.jsp"/>
<%
	}
	else{
%>

		 <jsp:include page="./logout_page.jsp"/>
<%
	}
%>		 
<%@ include file="./footer.jsp" %>
</body>
</html>