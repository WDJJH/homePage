<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file="./header.jsp" %> <!--header.jsp 실행 결과 보여줌-->
<%
	if(session.getAttribute("loginState").equals("login")) { // 로그인
%>
		 <jsp:include page="./login_page.jsp"/> <!--login_page.jsp 실행 결과 보여줌-->
<%
	}
%>
<%@ include file="./footer.jsp" %> <!--footer.jsp 실행 결과 보여줌-->
</body>
</html>