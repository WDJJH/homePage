<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> <!--아이디 중복 체크했을 때의 화면 설정-->
.div1 {
 	font-size: 14px;
 	font-weight: bold;
 	width: 100%;
 	height: 100%;
 	text-align: center;
}
</style>
</head>
<body>
	<% // 여기서부터
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost/member_db";
	String user = "root";
	String passwd = "root";

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	Statement stmt = con.createStatement(); // Statement: sql 문장을 처리하기 위해 존재하는 문장
	request.setCharacterEncoding("utf-8");
	// 여기까지는 DB 접속용 코드

	String userid = request.getParameter("userid"); // 아이디 중복 체크를 누르면서 넘겨받은 id 값을 저장
	String sql;
	int cnt = 0;
	ResultSet rs;
	if(userid == null) { // 만약 아이디가 비어있을 경우
%>
	<script>
	alert("접근할 수 없습니다."); // 접근할 수 없다는 경고문 출력
	self.close(); // 스스로 창 닫음
	</script>	
<% 
	return;	// jsp 종료
	}
	sql = "select count(*) from member "; // member 테이블로부터 전체 몇줄이 있는지 받아옴
	sql += " where mem_id= '"+userid+"' "; // 넘겨받은 id 값을 가지는 줄만이라는 조건 추가
	PreparedStatement pstmt = con.prepareStatement(sql); // PrepareStatement 변수에 sql 문을 넣음
			
	rs = pstmt.executeQuery(); // sql문을 실행하고 해당되는 결과를 쿼리 해옴
	while (rs.next()) { // 결과가 있을 경우(중복되는 아이디가 있을 경우)
		cnt = rs.getInt(1); // 쿼리 성공 시 1을 저장, 실패 시 0을 저장
	}
%>	
<div class="div1">
<%
	if(cnt == 0) { // 쿼리 실패(중복되는 값이 없음)
		out.print("사용 가능한 아이디입니다.");
	} else { // 쿼리 성공(중복되는 값이 있음)
		out.print("사용 중인 아이디입니다.");
	}
%>
</div>
	</body>
</html>