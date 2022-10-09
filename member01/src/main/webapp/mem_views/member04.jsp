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
<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3305/member_db";
	String user = "root";
	String passwd = "root";

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	Statement stmt = con.createStatement();
	request.setCharacterEncoding("UTF-8");

	String mem_name;
	String mem_id;
	String mem_passwd;
	String mem_email;
	String mem_phone;
	String mem_RRN;
	

	String sql = "SELECT * FROM member ORDER BY mem_num";
	ResultSet rs = stmt.executeQuery(sql);
%>
	<%@ include file="../header.jsp" %>
	
	<!--<img src="../images/member04.PNG" width="1024"/>-->
	
	<h1>관리자 조회 모드</h1>
	<table border="1">
		<thread>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주민등록번호</th>
			</tr>
		</thread>
		<tbody>
<% 
	while(rs.next()) {
		mem_name = rs.getString("mem_name");
		mem_id = rs.getString("mem_id");
		mem_passwd = rs.getString("mem_passwd");
		mem_email = rs.getString("mem_email");
		mem_phone = rs.getString("mem_phone");
		mem_RRN = rs.getString("mem_RRN");
%>

	<tr>
		<td><%=mem_name%></td>
		<td><%=mem_id%></td>
		<td><%=mem_passwd%></td>
		<td><%=mem_email%></td>
		<td><%=mem_phone%></td>
		<td><%=mem_RRN%></td>
	</tr>
	
<% 
	}
%>
	</tbody>
	</table>
<br>
<a href="../index.jsp">메인으로 돌아가기</a>
<br>	
	
<%@ include file="../footer.jsp" %>


</body>
</html>