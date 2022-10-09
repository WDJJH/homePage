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
	if (session.isNew()) { // 기본 세션들을 생성
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
			<td><img src="/member/images/yju_logo_01.png" /></td>
			<td width="400" align="center"><h1>회원관리 시스템 V0.1</h1></td>
			<td>
				<%
				if (session.getAttribute("loginState").equals("login")) { // session에 저장된 로그인 상태가 로그인일 경우
				%> <%=session.getAttribute("userName")%>님 로그인중. <!--session에 저장된 사용자 이름을 포함해 ~~님 로그인중 출력-->
				<form name="logout" method="post" action="/member/mem_models/member_dao.jsp"> <!--로그아웃 버튼 -->
					<input type="hidden" name="actionType" value="LOGOUT">
					<input type="submit" value="로그아웃">	
				</form>
				 <%
 					} else if (session.getAttribute("loginState").equals("join")) { // session에 저장된 로그인 상태가 회원가입일 경우 그림과 회원관리 시스템 글자 말고는 아무것도 띄우지 않음
					} else { // session에 저장된 로그인 상태가 로그아웃일 경우
%>

				<form name="login" method="post" action="/member/mem_models/member_dao.jsp"> <!-- form 태그안에 있는 버튼 클릭시 member_dao로 이동 -->
					아이디 : <input type="text" name="userid" size="10"> <!-- 아이디를 적기 위한 텍스트 공간 -->
					비밀번호 : <input type="password" name="passwd" size="10"> <!-- 비밀번호를 적기 위한 텍스트 공간 -->
					<input type="hidden" name="actionType" value="LOGIN"> <!-- 다른 버튼 클릭시 LOGIN이라는 값을 넣은 actionType을 같이 넘겨줌 -->
					<input type="submit" value="로그인"> <!-- 로그인 버튼을 누르면 dao로 이동 -->
					<input type="button" value="회원가입" onclick = "location.href = '/member/join.jsp'"><!-- 버튼 클릭시 join.jsp로 이동 -->
				</form>
<%
 				if (session.getAttribute("loginState").equals("errorID")) { // 로그인 상태가 errorID일 경우
 					out.print("[사용자ID오류]"); // 사용자ID오류를 출력
 				}
				if (session.getAttribute("loginState").equals("errorPW")) { // 로그인 상태가 errorPW일 경우
 					out.print("[사용자PW오류]"); // 사용자PW오류를 출력
 				} 
 			} 
 %>
			</td>
		</tr>
	</table>
<%
	if (session.getAttribute("loginState").equals("login")) { // 로그인 상태가 로그인 상태일 경우
%>
		<%@ include file="/GNB.jsp"%> <!--GNB.jsp의 실행 결과를 화면에 바로 보여줌-->
<%
	}
%>
	<hr>
</body>
</html>