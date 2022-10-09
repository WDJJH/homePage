<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*function modiCheck() {

    var result = confirm("수정하시겠습니까?");

    if(result)  {
    	alert("수정하였습니다.");
    	session.setAttribute("modiCheck", true);
    } else {
    	session.setAttribute("modiCheck", false);
   }
}*/
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<!--<img src="../images/member02.PNG" width="1024"/>-->
<h1>회원 정보 수정 페이지</h1>
<form method="post" action="../mem_models/member_dao.jsp">
	이름 : <input type = "text" name = "userName" size = "30" value = "<%=session.getAttribute("userName")%>" readonly>
	<br>아이디 : <input type = "text" name = "userid" size = "30" value = "<%=session.getAttribute("userid")%>" readonly>
	<br>비밀번호 : <input type = "text" name = "userpw" size = "30" value = "<%=session.getAttribute("userpw")%>">
	<br>이메일 : <input type = "text" name = "userEmail" size = "30" value = "<%=session.getAttribute("userEmail")%>">
	<br>전화번호 : <input type = "text" name = "userPhone" size = "30" value = "<%=session.getAttribute("userPhone")%>">
	<br>주민등록번호 : <input type = "text" name = "userRRN" size = "30" value = "<%=session.getAttribute("userRRN")%>" readonly>
	<br><input type = "hidden" name = "actionType" value = "MODIFY">
	<br><input type = "submit" id="modi" value = "수정" onclick="return confirm('수정하시겠습니까?');">
</form>

<br>
<a href="../index.jsp">메인으로 돌아가기</a>

<%@ include file="../footer.jsp" %>
</body>
</html>