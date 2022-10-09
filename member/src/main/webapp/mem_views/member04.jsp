<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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

	String mem_name; // Name~RRN용 변수
	String mem_id;
	String mem_passwd;
	String mem_email;
	String mem_phone;
	String mem_RRN;

	String sql = "SELECT * FROM member ORDER BY mem_num"; // 넘겨받은 ID 값으로 SELECT 실행
	ResultSet rs = stmt.executeQuery(sql); // sql 문으로 쿼리해옴
	%>
	<%@ include file="../header.jsp"%> <!--header.jsp 실행 결과 보여줌-->

	<!--<img src="../images/member04.PNG" width="1024"/>-->

	<h1>관리자 조회 모드</h1>
	<table border="1"> <!--표의 두께를 설정-->
		<thread>
		<tr>
			<th>이름</th> <!--회원의 이름부터 주민등록번호까지 컬럼을 설정-->
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주민등록번호</th>
		</tr>
		</thread>
		<tbody>
			<%
			while (rs.next()) { // 가져온 값이 있을 경우 실행(잘못된 sql 문으로 값을 가져오지 못한 경우 아예 실행이 안됨) 관리자는 여러명의 정보를 보기에 한번 실행하는 if와 달리 while을 사용해 필요한 만큼 나오게 반복
				mem_name = rs.getString("mem_name"); // 가져온 name~RRN 값을 각 변수에 넣어줌
				mem_id = rs.getString("mem_id");
				mem_passwd = rs.getString("mem_passwd");
				mem_email = rs.getString("mem_email");
				mem_phone = rs.getString("mem_phone");
				mem_RRN = rs.getString("mem_RRN");
			%>

			<tr>
				<td><%=mem_name%></td> <!--저장되있는 변수값을 보여줌-->
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
	<a href="../index.jsp">메인으로 돌아가기</a> <!--링크 클릭시 index.jsp로 돌아감-->
	<br>

	<%@ include file="../footer.jsp"%> <!--footer.jsp 실행 결과 보여줌-->


</body>
</html>