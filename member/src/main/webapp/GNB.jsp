<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<table>
		<tr>

			<td><a href="/member/mem_views/member01.jsp?mem_id=<%=session.getAttribute("userid")%>">GNB01</a></td> <!--세션에 저장된 id 값을 넘겨주면서 이동-->
			<td><a href="/member/mem_views/member02.jsp?mem_id=<%=session.getAttribute("userid")%>">GNB02</a></td> <!--세션에 저장된 id 값을 넘겨주면서 이동-->
			<td><a href="/member/mem_views/member03.jsp">GNB03</a></td>
			<%
			if (session.getAttribute("userClass").equals("30")) { // 관리자일때는 추가 항목을 더 보여줌
			%>
			<td><a href="/member/mem_views/member04.jsp">GNB04</a></td>
			<td><a href="/member/mem_views/member05.jsp">GNB05</a></td>
			<td><a href="/member/mem_views/member06.jsp">GNB06</a></td>

			<%
			} else {
			}
			%>
		</tr>
	</table>
</body>
</html>