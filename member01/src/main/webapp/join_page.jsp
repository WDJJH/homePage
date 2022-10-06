<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>회원가입</h1>
	<hr>
	<form name="join" method="post" action="/member01/mem_models/member_dao.jsp">
		<table border="1">
			<thead>
				<tr>
					<td colspan="2">회원가입</td>
				<tr>
			</thead>
			<tbody>
				<tr>
					<td>이름</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid">
					<input type="button" name="actionType" value="check"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email1" size="10">
					@
					<select name="email2">
						<option value="">------</option>
    					<option value="gmail.com">gmail.com</option>
    					<option value="naver.com">naver.com</option>
    					<option value="hanmail.net">hanmail.net</option>
					</select></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone1" size="5"> -
					<input type="text" name="phone2" size="5"> -
					<input type="text" name="phone3" size="5"></td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="RRN1" size="5"> - 
					<input type="text" name="RRN2" size="5">
					<input type="hidden" name="actionType" value="JOIN"> </td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="가입">
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>