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

	<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3305/member_db";
	String user = "root";
	String passwd = "root";
	String sql;
	int result;
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	Statement stmt = con.createStatement();
	request.setCharacterEncoding("UTF-8");
	String actionType = request.getParameter("actionType");

	String userID="";
	String userPW="";
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
		userID = request.getParameter("userid");
		userPW = request.getParameter("passwd");
		
		sql = "SELECT * FROM member WHERE mem_id ='" + userID + "'";
		pstmt = con.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			conID = rs.getString("mem_id");
			conPW = rs.getString("mem_passwd");
			userName = rs.getString("mem_name");
			userEmail = rs.getString("mem_email");
			userPhone = rs.getString("mem_phone");
			userRRN = rs.getString("mem_RRN");
			userClass = rs.getString("mem_Class");
		}
		if (userID.equals(conID)) {
			if (userPW.equals(conPW)) {
				session.setAttribute("loginState", "login");
				session.setAttribute("userid", userID);
				session.setAttribute("userpw", userPW);
				session.setAttribute("userName", userName);
				session.setAttribute("userEmail", userEmail);
				session.setAttribute("userPhone", userPhone);
				session.setAttribute("userRRN", userRRN);
				session.setAttribute("userClass", userClass);
			} else {
				session.setAttribute("loginState", "errorPW");
			}
		} else {
			session.setAttribute("loginState", "errorID");
		}
		
		break;

	case "LOGOUT": // 로그아웃
		session.setAttribute("userid", null);
		session.setAttribute("userpw", null);
		session.setAttribute("loginState", "logout");
		break;
		
	      
	case "MODIFY": // 수정
		userID = request.getParameter("userid");
		userPW = request.getParameter("userpw");
		userEmail = request.getParameter("userEmail");
		userPhone = request.getParameter("userPhone");
		
		sql = "UPDATE member SET mem_passwd = ?, mem_email = ?, mem_phone = ? WHERE mem_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userPW);
	    pstmt.setString(2, userEmail);
	    pstmt.setString(3, userPhone);
	    pstmt.setString(4, userID);
	    
	    pstmt.executeUpdate();
	    session.setAttribute("userpw", userPW);
	    session.setAttribute("userEmail", userEmail);
		session.setAttribute("userPhone", userPhone);
		break;
		
	case "DELETE": // 삭제
		userID = request.getParameter("mem_id");
		sql = "DELETE FROM member WHERE mem_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userID);
		
		pstmt.executeUpdate();
		session.setAttribute("loginState", "logout");
		break;
		
	default:
		break;
	}
	%>

	<jsp:forward page="../index.jsp" />

</body>
</html>