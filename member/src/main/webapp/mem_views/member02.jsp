<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% // 여기서부터
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost/member_db";
	String user = "root";
	String passwd = "root";

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	Statement stmt = con.createStatement();
	request.setCharacterEncoding("UTF-8");
	// 여기까지는 DB 접속용 코드

	String mem_name=""; // Name~RRN용 변수
	String mem_passwd = "";
	String mem_email = "";
	String mem_phone = "";
	String mem_RRN = "";
	
	String mem_id = request.getParameter("mem_id"); // 페이지를 실행할 때 넘겨받은 id 값을 mem_id에 넣음

	String sql = "SELECT * FROM member WHERE mem_id = '" + mem_id + "'"; // 해당하는 id 값을 가진 정보를 가져옴
	ResultSet rs = stmt.executeQuery(sql); // sql 문으로 쿼리해옴
	
	if (rs.next()) { // 가져온 값이 있을 경우 실행(잘못된 sql 문으로 값을 가져오지 못한 경우 아예 실행이 안됨)
		mem_name = rs.getString("mem_name"); // 가져온 name~RRN 값을 각 변수에 넣어줌
		mem_passwd = rs.getString("mem_passwd");
		mem_email = rs.getString("mem_email");
		mem_phone = rs.getString("mem_phone");
		mem_RRN = rs.getString("mem_RRN");
	}
%>
</head>
<body>
	<%@ include file="../header.jsp"%> <!--header.jsp 실행 결과 보여줌-->
	<!--<img src="../images/member02.PNG" width="1024"/>-->
	<h1>회원 정보 수정 페이지</h1>
	<form method="post" action="../mem_models/member_dao.jsp"> <!--form 태그안에 있는 버튼 클릭시 member_dao로 이동-->
		이름 : <input type="text" name="userName" size="30" value="<%=mem_name%>" readonly> <!--이름 정보를 적어놓는 공간(readonly로 수정 불가능)-->
		<br>아이디 : <input type="text" name="userid" size="30" value="<%=mem_id%>" readonly> <!--아이디 정보를 적어놓는 공간(readonly로 수정 불가능)-->
		<br>비밀번호 : <input type="text" name="userpw" size="30" value="<%=mem_passwd%>"> <!--비밀번호 정보를 적어놓는 공간-->
		<br>이메일 : <input type="text" name="userEmail" size="30" value="<%=mem_email%>"> <!--이메일 정보를 적어놓는 공간-->
		<br>전화번호 : <input type="text" name="userPhone" size="30" value="<%=mem_phone%>"> <!--전화번호 정보를 적어놓는 공간-->
		<br>주민등록번호 : <input type="text" name="userRRN" size="30" value="<%=mem_RRN%>" readonly> <br> <!--주민등록번호 정보를 적어놓는 공간(readonly로 수정 불가능)-->
		<input type="hidden" name="actionType" value="MODIFY"> <br> <!--MODIFY라는 값을 넣은 actionType이라는 변수를 hidden으로 숨겨놓고 버튼을 클릭했을 때 같이 넘겨줌-->
		<input type="submit" value="수정" onclick="return confirm('수정하시겠습니까?');"> <!--submit 타입으로 수정이라는 글자를 보이고 클릭하면 수정하겠습니까라는 질문이 나오고 확인을 누르면 return true가 되서 그대로 dao로 가서 실행하고 취소를 누르면 return false가 되서 dao로 가지 않음-->
	</form>

	<br>
	<a href="../index.jsp">메인으로 돌아가기</a> <!--링크 클릭시 index.jsp로 돌아감-->

	<%@ include file="../footer.jsp"%> <!--footer.jsp 실행 결과 보여줌-->
</body>
</html>