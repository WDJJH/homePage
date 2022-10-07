<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <img src="/member01/images/yju_com_01.jpg"/>
 
 <ul> 
  <li> <a href="/member/mem_views/member01.jsp?mem_id=<%=session.getAttribute("userid")%>">회원관리페이지01</a>
  <li> <a href="/member/mem_views/member02.jsp">회원관리페이지02</a>
  <li> <a href="/member/mem_views/member03.jsp">회원관리페이지03</a>
<% 
	if (session.getAttribute("userClass").equals("30")) { // 관리자일때
%>
  		<li> <a href="/member/mem_views/member04.jsp">회원관리페이지04</a>
  		<li> <a href="/member/mem_views/member05.jsp">회원관리페이지05</a>
  		<li> <a href="/member/mem_views/member06.jsp">회원관리페이지06</a>
<%
	} else {}
%>
 </ul>

</body>
</html>