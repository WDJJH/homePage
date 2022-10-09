<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteCheck() {
		var check = document.getElementById("pwCheck");
    	if(check.equals(pw))  {
    		alert("삭제하였습니다.");
    		System.out.println("삭제");
    	} else {
	}
}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<h1>회원 정보 탈퇴</h1>
	<!--<img src="../images/member03.PNG" width="1024" />-->
	<h3>정말 탈퇴하시겠습니까?</h3>
	<br>
	<form id="pwCheck" method="post" action="../mem_models/member_dao.jsp">
		비밀번호 : <input type = "text" name = "pwCheck" size = "30">
		<br><input type = "hidden" name = "actionType" value = "DELETE">
		<br><input type = "submit" id="modi" value = "삭제" onclick="deleteCheck()">
	</form>
	<br>
	<a href="../index.jsp">메인으로 돌아가기</a>

	<%@ include file="../footer.jsp"%>
</body>
</html>