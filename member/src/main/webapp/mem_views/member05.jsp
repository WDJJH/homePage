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

	String sql = "SELECT * FROM member ORDER BY mem_num"; // mem_num 값을 기준으로 SELECT 실행
	ResultSet rs = stmt.executeQuery(sql); // sql 문의 결과를 가져옴
	%>
	<%@ include file="../header.jsp"%> <!--header.jsp 실행 결과 보여줌-->

	<!--<img src="../images/member05.PNG" width="1024"/>-->

	<h1>관리자 수정 모드</h1>
	<table border="1"> <!--표의 두께를 설정-->
		<thread>
		<tr>
			<th>이름</th> <!--회원의 이름부터 수정까지 컬럼을 설정-->
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주민등록번호</th>
			<th>수정</th>
		</tr>
		</thread>
		<tbody>
			<%
			while (rs.next()) { // 가져온 값이 있을 경우 실행(잘못된 sql 문으로 값을 가져오지 못한 경우 아예 실행이 안됨)
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
				<td><input type="button" onclick="location.href='./member05_1.jsp?mem_name=<%=mem_name%>&mem_id=<%=mem_id%>&mem_passwd=<%=mem_passwd%>&mem_email=<%=mem_email%>&mem_phone=<%=mem_phone%>&mem_RRN=<%=mem_RRN%>'" value="수정"></td>
				<!--수정 버튼 클릭시 해당하는 링크로 이동하면서 적혀있는 이름부터~주민등록번호 정보를 같이 값을 수정하기 위한 공간인 member05_1로 넘겨줌-->
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