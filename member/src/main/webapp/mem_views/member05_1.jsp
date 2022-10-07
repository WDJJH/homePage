<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3305/member_db";
	String user = "root";
	String passwd = "root";

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	Statement stmt = con.createStatement();
	request.setCharacterEncoding("UTF-8");

	String mem_name="";
	String mem_id="";
	String mem_passwd="";
	String mem_email="";
	String mem_phone="";
	String mem_RRN="";
	
	String userID = request.getParameter("mem_id");
	System.out.println(userID);
	String sql = "SELECT * FROM member WHERE mem_id = '" + userID + "'";
	ResultSet rs = stmt.executeQuery(sql);

	while(rs.next()) {
		mem_name = rs.getString("mem_name");
		mem_id = rs.getString("mem_id");
		mem_passwd = rs.getString("mem_passwd");
		mem_email = rs.getString("mem_email");
		mem_phone = rs.getString("mem_phone");
		mem_RRN = rs.getString("mem_RRN");
	}
%>
<form method="post" action="../mem_models/member_dao.jsp">
	이름 : <input type = "text" name = "userName" size = "30" value = "<%=mem_name%>" readonly>
	<br>아이디 : <input type = "text" name = "userid" size = "30" value = "<%=mem_id%>" readonly>
	<br>비밀번호 : <input type = "text" name = "userpw" size = "30" value = "<%=mem_passwd%>">
	<br>이메일 : <input type = "text" name = "userEmail" size = "30" value = "<%=mem_email%>">
	<br>전화번호 : <input type = "text" name = "userPhone" size = "30" value = "<%=mem_phone%>">
	<br>주민등록번호 : <input type = "text" name = "userRRN" size = "30" value = "<%=mem_RRN%>" readonly>
	<br><input type = "hidden" name = "actionType" value = "MODIFY">
	<br><input type = "submit" id="modi" value = "수정" onclick="return confirm('수정하시겠습니까?');">
</form>

<br>
<a href="../index.jsp">메인으로 돌아가기</a>
<%@ include file="../footer.jsp" %>

</body>
</html>