<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<table>
 <tr>
	 <td><img src="/member/images/yju_logo_01.png"/></td> 
	 <td width="400" align="center"><h1>회원관리 시스템 V0.1</h1></td> 
	 <td>
<%
		if(session.getAttribute("loginState").equals("login")){
%>
		<%=session.getAttribute("userName")%>님 로그인중.
		<form name="logout" method="post" action="/member/mem_models/member_dao.jsp"> <!--로그아웃 버튼 -->
		  <input type="hidden" name="actionType" value="LOGOUT">
		  <input type="submit" value="로그아웃">
		</form>
<%
		} else if (session.getAttribute("loginState").equals("join")) {
			
		}
		else {
%>		 
		 <form name="login" method="post" action="/member/mem_models/member_dao.jsp">
		    아이디 : <input type="text" name="userid" size="10">
		    비밀번호 : <input type="password" name="passwd" size="10">
		    <input type="hidden" name="actionType" value="LOGIN">
		    <input type="submit" value="로그인">
		 </form>
		 <form name="register" method = "post" action="/member/mem_models/member_dao.jsp">
		 	<input type="hidden" name="actionType" value="GR">
		 	<input type="submit" value="회원가입">
		 </form>
<%
			if(session.getAttribute("loginState").equals("errorID")){
				out.print("[사용자ID오류]");
			}
			
			if(session.getAttribute("loginState").equals("errorPW")){
				out.print("[사용자PW오류]");
			}
		}
%>		
	 </td>
 </tr>
</table>
<%
		if(session.getAttribute("loginState").equals("login")){
%>
			<%@ include file= "/GNB.jsp" %>
<%
		}
%>
<hr> 
</body>
</html>