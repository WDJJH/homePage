<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function email_change(){
	if(document.join.email.options[document.join.email.selectedIndex].value == '0'){
		document.join.email2.disabled = true;
		document.join.email2.value = "";
	}
	if(document.join.email.options[document.join.email.selectedIndex].value == '9'){
		document.join.email2.disabled = false;
		document.join.email2.value = "";
		document.join.email2.focus();
	} else{
		document.join.email2.disabled = true;
		document.join.email2.value = document.join.email.options[document.join.email.selectedIndex].value;
	}
}
</script>
</head>
<body>

<form method="post" action="./mem_models/member_dao.jsp">
	<br>아이디 : <input type = "text" name = "mem_id" size = "30">
	<form method="post" action="./mem_models/member_dao.jsp">
		<input type = "hidden" name = "actionType" value = "CHECK">
		<input type = "hidden" name = "mem_id" value = "mem_id">
		<input type = "submit" value = "중복 확인">
	</form>
	비밀번호 : <input type = "text" name = "mem_passwd" size = "30">
	<br>이름 : <input type = "text" name = "mem_name" size = "30">
	<br><form name="join"> 이메일 : 
	<input type="text" name="email1" value="이메일" onfocus="this.value='';">   @
	<input type="text" name="email2" value="" disabled >
		<select name="email" onchange="email_change()">
    		<option value="0" >선택하세요</option>
    		<option value="9">직접입력</option>
    		<option value="naver.com">naver.com</option>
    		<option value="nate.com">nate.com</option> 
   		</select>
	</form> 	
	전화번호 : <input type = "text" name = "mem_phone" size = "10">
	<br>주민등록번호 : <input type = "number" name = "mem_RRN_1" size = "10">-<input type = "password" name = "mem_RRN_2" size = "10">
	<br><input type = "hidden" name = "actionType" value = "REGISTER">
	<br><input type = "submit" value = "회원가입">
</form>
</body>
</html>