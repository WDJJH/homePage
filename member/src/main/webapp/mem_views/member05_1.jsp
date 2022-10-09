<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../header.jsp"%> <!--header.jsp 실행 결과 보여줌-->
<%
	
	String mem_name = request.getParameter("mem_name"); // 페이지를 넘어가면서 같이 넘어온 이름~주민등록번호 값들을 변수에 다 넣음
	String mem_id = request.getParameter("mem_id");
	String mem_passwd = request.getParameter("mem_passwd");
	String mem_email = request.getParameter("mem_email");
	String mem_phone = request.getParameter("mem_phone");
	String mem_RRN = request.getParameter("mem_RRN");

%>
	<form method="post" action="../mem_models/member_dao.jsp"> <!--form 태그 안에 있는 버튼 클릭시 dao로 이동-->
		이름 : <input type="text" name="userName" size="30" value="<%=mem_name%>" readonly>  <!--이름 정보를 적어놓는 공간(readonly로 수정 불가능)-->
		<br>아이디 : <input type="text" name="userid" size="30" value="<%=mem_id%>" readonly> <!--아이디 정보를 적어놓는 공간(readonly로 수정 불가능)-->
		<br>비밀번호 : <input type="text" name="userpw" size="30" value="<%=mem_passwd%>"> <!--비밀번호 정보를 적어놓는 공간-->
		<br>이메일 : <input type="text" name="userEmail" size="30" value="<%=mem_email%>"> <!--이메일 정보를 적어놓는 공간-->
		<br>전화번호 : <input type="text" name="userPhone" size="30" value="<%=mem_phone%>"> <!--전화번호 정보를 적어놓는 공간-->
		<br>주민등록번호 : <input type="text" name="userRRN" size="30" value="<%=mem_RRN%>" readonly> <!--주민등록번호 정보를 적어놓는 공간(readonly로 수정 불가능)-->
		<br><input type="hidden" name="actionType" value="MODIFY"> <!--MODIFY라는 값을 넣은 actionType이라는 변수를 hidden으로 숨겨놓고 버튼을 클릭했을 때 같이 넘겨줌-->
		<br><input type="submit" value="수정" onclick="return confirm('수정하시겠습니까?');"> <!--submit 타입으로 수정이라는 글자를 보이고 클릭하면 수정하겠습니까라는 질문이 나오고 확인을 누르면 return true가 되서 그대로 dao로 가서 실행하고 취소를 누르면 return false가 되서 dao로 가지 않음-->
	</form>

	<br>
	<a href="../index.jsp">메인으로 돌아가기</a> <!--링크 클릭시 index.jsp로 돌아감-->
	<%@ include file="../footer.jsp"%> <!--footer.jsp 실행 결과 보여줌-->

</body>
</html>