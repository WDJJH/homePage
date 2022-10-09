<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"> // 자바스크립트 코드를 쓰기 위한 script 공간
	function deleteCheck_1() { // 탈퇴를 선택했을 때 확인을 위한 메소드
		let check = confirm("정말 탈퇴하시겠습니까?"); // 정말 탈퇴하시겠습니까라는 확인문이 나옴
		if (check === true) { // 확인을 고르면 deleteCheck_2 메소드를 실행
			deleteCheck_2();
			return true;
		} else { // 취소를 고르면 아무것도 실행하지 않음
			return false;
		}
	}

	function deleteCheck_2() { // 확인하였을 때 PW 값이 맞는지 비교하기 위한 메소드
		let check_1 = document.getElementById('pwCheck').value; // 직접 적은 비밀번호 값을 가져옴
		let check_2 = document.getElementById('pw').value; // 숨겨놓은 원래 비밀번호 값을 가져옴
		if (check_1 != check_2) { // 만약 비밀번호가 틀렸을 경우
			alert("비밀번호가 틀렸습니다."); // 비밀번호가 틀럈습니다 라는 경고문 출력
			return false;
		} else {
			alert("삭제하였습니다."); // 만약 비밀번호가 맞았을 경우
			go_dao(); // 다음 메소드 실행
			return true;
		}
	}
	
	function go_dao() { // 확인도 누르고 비밀번호도 맞았을 경우
		let id_value = document.getElementById('id').value; // 숨겨놓은 아이디 값을 가져옴
		location.href='../mem_models/member_dao.jsp?mem_id='+ id_value + '&actionType=DELETE'; // 해당하는 id 값과 DELETE라는 값을 넣은 actionType 변수를 dao로 넘김
		return true;
	}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%> <!--header.jsp 실행 결과 보여줌-->
	<h1>회원 정보 탈퇴</h1>
	<!--<img src="../images/member03.PNG" width="1024" />-->
	<h3>정말 탈퇴하시겠습니까?</h3>
	<br>비밀번호 : <input type="text" id="pwCheck" name="pwCheck" size="30"> <!--pwCheck라는 아이디를 가진 입력창 생성-->
	<input type="hidden" id="id" value="<%=session.getAttribute("userid")%>"> <!--session에 저장되어 있는 id값과 pw값을 숨겨놓은 상태로 저장함-->
	<input type="hidden" id="pw" value="<%=session.getAttribute("userpw")%>">
	<input type="button" onclick="return deleteCheck_1();" value="삭제"> <!--삭제라고 적힌 버튼 클릭시 deleteCheck_! 함수를 실행-->
	<br>
	<br>
	<a href="../index.jsp">메인으로 돌아가기</a> <!--링크 클릭시 index.jsp로 돌아감-->

	<%@ include file="../footer.jsp"%> <!--footer.jsp 실행 결과 보여줌-->
</body>
</html>