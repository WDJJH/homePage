<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
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
	String sql;
	int result;

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	Statement stmt = con.createStatement();
	request.setCharacterEncoding("UTF-8");
	String actionType = request.getParameter("actionType");
	System.out.println(actionType);
	// 여기까지는 DB 접속용 코드

	String userID = ""; // ID~Class용 변수
	String userPW = "";
	String userName = "";
	String userEmail = "";
	String userPhone = "";
	String userRRN = "";
	String userClass = "";

	String conID = "50"; // 로그인 비교용 ID
	String conPW = "50"; // 로그인 비교용 PW

	int loginState;
	PreparedStatement pstmt;

	switch (actionType) {
	case "LOGIN": // 로그인
		userID = request.getParameter("userid"); // 로그인할 때 적은 ID 값을 넘겨받음
		userPW = request.getParameter("passwd"); // 로그인할 때 적은 PW 값을 넘겨받음

		sql = "SELECT * FROM member WHERE mem_id ='" + userID + "'"; // 넘겨받은 ID 값으로 SELECT 실행

		ResultSet rs = stmt.executeQuery(sql); // 해당되는 sql문으로 결과를 쿼리 해옴

		while (rs.next()) {
			conID = rs.getString("mem_id"); // SELECT로 가져와진 ID ~ Class 값
			conPW = rs.getString("mem_passwd");
			userName = rs.getString("mem_name");
			userEmail = rs.getString("mem_email");
			userPhone = rs.getString("mem_phone");
			userRRN = rs.getString("mem_RRN");
			userClass = rs.getString("mem_Class");
		}
		if (userID.equals(conID)) { // 로그인 할때 적은 ID와 가져온 ID를 비교 (만약에 해당되는 ID가 없었으면 가져올 값이 없었으므로 false)
			if (userPW.equals(conPW)) { // 로그인 할때 적은 PW와 가져온 PW를 비교
				session.setAttribute("loginState", "login"); // 로그인에 성공했으니 로그인 상태를 로그인으로 저장
				session.setAttribute("userid", userID); // 로그인에 성공했으니 유저의 ID~Class 정보를 세션에 저장
				session.setAttribute("userpw", userPW);
				session.setAttribute("userName", userName);
				session.setAttribute("userEmail", userEmail);
				session.setAttribute("userPhone", userPhone);
				session.setAttribute("userRRN", userRRN);
				session.setAttribute("userClass", userClass);
			} else {
				session.setAttribute("loginState", "errorPW"); // PW가 틀려서 로그인 상태를 잘못된 PW로 저장
			}
		} else {
			session.setAttribute("loginState", "errorID"); // ID가 틀려서 로그인 상태를 잘못된 ID로 저장
		}

		break;

	case "LOGOUT": // 로그아웃
		session.setAttribute("userid", null); // 세션에 저장된 ID~PW 값을 비워줌
		session.setAttribute("userpw", null);
		session.setAttribute("loginState", "logout"); // 세션에 저장된 로그인 상태를 로그아웃으로 변경
		break;
		
	case "JOIN": // 가입
		request.setCharacterEncoding("utf-8");
		userName = request.getParameter("username"); // 가입 시 적은 이름~PW를 받아옴
		userID = request.getParameter("userid");
		userPW = request.getParameter("passwd");
		if (request.getParameter("email2") != null) { // 이메일 뒷부분을 직접 적었을 시
			userEmail = request.getParameter("email1") + "@" + request.getParameter("email2"); // 적은 내용을 붙여서 이메일로 만듦
		} else { // 이메일 뒷부분을 예시에 있는걸로 선택해서 넣었을 경우
			userEmail = request.getParameter("email1") + "@" + request.getParameter("email"); // 선택한 내용을 붙여서 이메일로 만듦
		}
		userPhone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" 
				+ request.getParameter("phone3"); // 전화번호의 앞 3칸, 중간 4칸, 뒤 4칸을 중간에 -를 붙여서 하나로 만듦
		userRRN = request.getParameter("RRN1") + "-" + request.getParameter("RRN2"); // 주민등록번호를 합쳐서 하나로 만듦
		
		sql = "INSERT INTO member (mem_name, mem_id, mem_passwd, mem_email, mem_phone, mem_RRN)" + "VALUES(?,?,?,?,?,?)"; // PreparedStatement 용으로 sql 문을 만듦
		pstmt = con.prepareStatement(sql); // PreparedStatement용으로 만든 sql을 PreparedStatement 변수인 pstmt 안에 넣음
		pstmt.setString(1, userName); // 1번째 ?에 userName 값을 넣고 2번째 ?에 userID 값을 넣는걸 6번쨰 ?에 userRRN 값을 넣는걸 실행
		pstmt.setString(2, userID);
		pstmt.setString(3, userPW);
		pstmt.setString(4, userEmail);
		pstmt.setString(5, userPhone);
		pstmt.setString(6, userRRN);
		result= pstmt.executeUpdate(); // sql 문으로 db 내용을 업데이트 함 (성공 시 result 값은 1, 실패 시 result 값은 0)
		
		if(result==1){
			session.setAttribute("loginState", "logout"); // 업데이트 성공시 처음 화면으로 돌아가기 위해 로그인 상태를 로그아웃으로 변경
		}
		break;

	case "MODIFY": // 수정
		userID = request.getParameter("userid"); // 누구의 정보를 수정할지 결정하기 위한 id 값을 넘겨받음
		userPW = request.getParameter("userpw"); // 수정하기 위한 PW~Phone 정보를 넘겨받음
		userEmail = request.getParameter("userEmail");
		userPhone = request.getParameter("userPhone");

		sql = "UPDATE member SET mem_passwd = ?, mem_email = ?, mem_phone = ? WHERE mem_id = ?"; // PreparedStatement용으로 sql 문을 만듦
		pstmt = con.prepareStatement(sql); // PreparedStatement용으로 만든 sql을 PreparedStatement 변수인 pstmt 안에 넣음
		pstmt.setString(1, userPW); // 해당하는 숫자번째의 ?에 뒤에 적힌 변수 값들을 넣음
		pstmt.setString(2, userEmail);
		pstmt.setString(3, userPhone);
		pstmt.setString(4, userID);

		pstmt.executeUpdate(); // sql 문으로 db 내용을 업데이트
		break;

	case "DELETE": // 삭제
		userID = request.getParameter("mem_id"); // 삭제할 대상의 id 값을 넘겨받음
		sql = "DELETE FROM member WHERE mem_id = ?"; // PreparedStatement용으로 sql 문을 만듦
		pstmt = con.prepareStatement(sql); // PreparedStatement용으로 만든 sql을 PreparedStatement 변수인 pstmt 안에 넣음
		pstmt.setString(1, userID); // 해당하는 숫자번째의 ?에 뒤에 적힌 변수 값들을 넣음

		pstmt.executeUpdate(); // sql 문으로 db 내용을 업데이트
		if(session.getAttribute("userClass").equals("100")) { // 관리자가 아닐 경우
			session.setAttribute("loginState", "logout"); // 삭제 성공시 처음 화면으로 돌아가기 위해 로그인 상태를 로그아웃으로 변경
		}
		break;

	default: // case 문을 실행할 때 해당하는 값이 아닌 값이 넘겨받았을 경우 실행하기 위한 코드
		break;
	}
	%>

	<jsp:forward page="../index.jsp" /> <!--로그인 상태면 로그인 화면으로 로그아웃 상태면 로그아웃 화면으로 이동-->

</body>
</html>