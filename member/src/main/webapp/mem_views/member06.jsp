<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"> // 자바스크립트 코드를 쓰기 위한 script 공간
	function go_dao(id) { // id 값을 매개변수로 받는 go_dao 함수
		let que = confirm("삭제하겠습니까?"); // 정말 삭제하기 위한 확인문 출력
		if (que === true) { // 확인을 눌렀을 경우
			location.href='../mem_models/member_dao.jsp?mem_id='+ id + '&actionType=DELETE'; // dao로 이동하면서 id 값을 넣은 mem_id 변수와 DELETE 값을 넣은 actionType 변수를 넘겨줌
			return true;
		} else { // 취소를 눌렀을 경우
			return false; // 아무것도 실행하지 않음
		}
	}
</script>
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

	String sql = "SELECT * FROM member ORDER BY mem_num";  // mem_num 값을 기준으로 전체 값을 가져옴
	ResultSet rs = stmt.executeQuery(sql); // SELECT sql문 결과를 쿼리해옴
	%>
	<%@ include file="../header.jsp"%> <!--header.jsp 실행 결과 보여줌-->

	<!--<img src="../images/member05.PNG" width="1024"/>-->

	<h1>관리자 삭제 모드</h1>
	<table border="1"> <!--표의 두께를 설정-->
		<thread>
		<tr>
			<th>이름</th> <!--회원의 이름부터 삭제까지 컬럼을 설정-->
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주민등록번호</th>
			<th>삭제</th>
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
				<td><input type="button" onclick="return go_dao('<%=mem_id%>')" value="삭제">
				<!--삭제 버튼 클릭시 각 mem_id를 매개변수로 하는 go_dao 함수를 실행-->
			</tr>
			<%
			}
			%>
		</tbody>
	</table>


	<br>
	<a href="../index.jsp">메인으로 돌아가기</a> <!--링크 클릭시 index.jsp로 돌아감-->

	<%@ include file="../footer.jsp"%> <!--footer.jsp 실행 결과 보여줌-->
</body>
</html>