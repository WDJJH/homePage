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

	<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost/member_db";
	String user = "root";
	String passwd = "password";

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	Statement stmt = con.createStatement();

	request.setCharacterEncoding("utf-8");
	String actionType = request.getParameter("actionType");
	String sql;
	
	ResultSet rs;
	
	int userNum;
	String userName;
	String userID;
	String userPW;
	String user_email;
	String user_phone;
	String user_RRN;
	String user_class;

	String userID_DUMMY = "kdhong";
	String userPW_DUMMY = "1234";

	int loginState;

	switch (actionType) {
	case "LOGIN":
		request.setCharacterEncoding("utf-8");

		userID = request.getParameter("userid");
		userPW = request.getParameter("passwd");

		sql = "SELECT * FROM member WHERE mem_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		String ID="ㅁㅁㅁㅁㅁㅁㅁㅁ";
		String PW="ㅁㅁㅁㅁㅁㅁㅁㅁ";
		String Name="ㅁㅁㅁㅁㅁㅁㅁ";
		pstmt.setString(1, userID);
		rs = pstmt.executeQuery();
		while(rs.next()){
			ID = rs.getString("mem_id");
			PW = rs.getString("mem_passwd");
			Name = rs.getString("mem_name");
		}
		if (userID.equals(ID)) {
			if (userPW.equals(PW)) {
				session.setAttribute("loginState", "login");
				session.setAttribute("userid", userID);
				session.setAttribute("userpw", userPW);
				session.setAttribute("userName", Name);
			} else {
				session.setAttribute("loginState", "errorPW");
			}
		} else {
			session.setAttribute("loginState", "errorID");
		}
		break;
		
	case "LOGOUT":
		session.setAttribute("userid", null);
		session.setAttribute("userpw", null);
		session.setAttribute("loginState", "logout");
		break;

	case "JOIN":
		request.setCharacterEncoding("utf-8");
		userName = request.getParameter("username");
		userID = request.getParameter("userid");
		userPW = request.getParameter("passwd");
		user_email = request.getParameter("email1") + "@" + request.getParameter("email2");
		user_phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
		+ request.getParameter("phone3");
		user_RRN = request.getParameter("RRN1") + "-" + request.getParameter("RRN2");

		sql = "INSERT INTO member (mem_name, mem_id, mem_passwd, mem_email, mem_phone, mem_RRN)"
		+ "VALUES(?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userName);
		pstmt.setString(2, userID);
		pstmt.setString(3, userPW);
		pstmt.setString(4, user_email);
		pstmt.setString(5, user_phone);
		pstmt.setString(6, user_RRN);
		int result = pstmt.executeUpdate();
		if (result == 1){
			session.setAttribute("loginState", "logout");
		}
		else{
			
		}
		break;
		
	case "Next":
		session.setAttribute("loginState", "Next");
		break;
		
		default:
			break;
	}
	%>

	<jsp:forward page="../index.jsp" />

</body>
</html>