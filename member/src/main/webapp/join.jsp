<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/member/css/join.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script type="text/javascript"> // 자바스크립트 코드를 쓰기 위한 script 공간
$(document).ready(function(){
	$("#myModal").modal('show');
});

function fn_idcheck() { // 아이디 중복 체크
	var userid = document.JOIN.userid.value; // 아이디 텍스트 공간에 적은 값을 가져옴
	
	if(userid == "") { // 아이디가 비어있을 경우
		alert("아이디를 입력해 주세요!"); // 아이디를 입력해주세요하는 경고문 출력
		document.getElementById('idNull').value = "0"; // idNull 값을 0으로 만들어 가입 버튼을 비활성화
		document.JOIN.userid.focus(); // 선택 효과를 줌(역할은 없음)
		return false; // 아래를 더 비교하지 않고 return해서 메소드를 종료
	}
	if(userid.length < 6 || userid.length > 12) { // 아이디가 6글자보다 짧거나 12글자보다 길 경우
		alert("아이디를 사용하실 수 없습니다."); // 아이디를 사용하실 수 없습니다라는 경고문 출력
		document.getElementById('idNull').value = "0"; // idNull 값을 0으로 만들어 가입 버튼을 비활성화
		document.JOIN.userid.focus(); // 선택 효과를 줌(역할은 없음)
		return false; // 아래를 더 비교하지 않고 return해서 메소드를 종료
	}
	var url = "idcheck.jsp?userid="+userid; // 이동할 링크에 적어놓은 아이디 값을 함께 넘겨줌
	document.getElementById('idNull').value = "1"; // 가입 버튼을 활성화 하기 위해 1로 변경
	btnActive(); // 가입 버튼 활성화 메소드
	window.open(url, "중복 아이디 체크", "width=300, height=200"); // 중복 아이디 체크를 idcheck.jsp로 필요한 값들을 넘기면서 결과를 윈도우 창을 띄우면서 보여줌
}


function juminOk() { //주민번호 맨 끝자리(확인번호) 체크
    var check = [2,3,4,5,6,7,8,9,2,3,4,5]; // 검사할 배열
    var jumin = JOIN.RRN1.value + JOIN.RRN2.value; // 주민등록번호 앞자리와 뒷자리를 다 합침
    var gopHap = 0; // 체크를 위한 변수

    for(var i=0; i<12; i++) {
      gopHap += (check[i] * parseInt(jumin.charAt(i))); // 주민번호와 검사할 배열의 각 자리의 수들을 숫자로 바꾸고 다 곱하면서 gopHap에 더함
    }
    var juminNa = gopHap % 11; // 다 더한 gopHap 변수를 11로 나눈 나머지를 juminNa에 저장
    var checkdigit = 11 - juminNa; // checkdigit에 11에서 juminNa 값을 빼줌

    if(checkdigit == jumin.substring(jumin.length-1)) { // 만약 checkdigit 값이 주민등록번호의 길이에서 1을 뺀 수인 12자리의 수와 비교해 같을 경우
      alert("주민번호 확인 완료.") // 주민번호 확인 완료 출력
      document.getElementById('RRNNull').value = "1"; // 가입 버튼 활성화를 위한 값 변경
      btnActive(); // 가입 버튼 활성화를 위한 메소드 실행
    }
    else { // 만약 틀렸을 경우
      alert("주민번호가 틀렸습니다."); // 주민번호가 틀렸다는 확인문 출력
      document.getElementById('RRNNull').value = "0"; // 가입 버튼 비활성화를 위한 값 변경
    }
  }

function check_pw(){ // 비밀번호와 비밀번호 확인의 값이 같은지 비교하기 위한 메소
	 
    var pw = document.getElementById('pw').value; // 비밀번호 칸에 적어놓은 값을 가져옴

    if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){ // 만약 비밀번호 칸과 비밀번호 확인칸이 빈칸이 아닌 경우
        if(document.getElementById('pw').value==document.getElementById('pw2').value){ // 만약 비밀번호와 비밀번호 확인 칸의 값이 같은 경우
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.' // check라는 id를 가진 코드의 html 내용을 비밀번호가 일치합니다로 변경
            document.getElementById('check').style.color='blue'; // check라는 id를 가진 코드의 hmtl 색을 파랑색으로 변경
            document.getElementById('pwNull').value = "1"; // 가입 버튼 활성화를 위한 값 변경
            btnActive(); // 가입 버튼 활성화를 위한 메소드 실행
        }
        else{ // 만약 비밀번호와 비밀번호 확인 칸의 값이 다른 경우
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.'; // check라는 id를 가진 코드의 html 내용을 비밀번호가 일치합니다로 변경
            document.getElementById('check').style.color='red'; // check라는 id를 가진 코드의 hmtl 색을 빨강색으로 변경
            document.getElementById('RRNNull').value = "0"; // 가입 버튼 비활성화를 위한 값 변경
            btnDisabled(); // 가입 버튼 비활성화를 위한 메소드 실행
        }
    } else {  // 만약 비밀번호 칸과 비밀번호 확인칸이 빈칸일 경우
    	btnDisabled(); // 가입 버튼 비활성화를 위한 메소드
    }
}
function btnActive()  { // 가입 버튼 활성화를 위한 메소드
	  const target = document.getElementById('joinCheck'); // 가입 버튼의 정보를 가져옴
	  const target_1 = document.getElementById('idNull').value; // idNull 값을 가져옴
	  const target_2 = document.getElementById('pwNull').value; // pwNull 값을 가져옴
	  const target_3 = document.getElementById('RRNNull').value; // RRNNull 값을 가져옴
      if (target_1 != "0" && target_2 != "0" && target_3 != "0") {// 만약 아이디 중복체크, 비밀번호 확인, 주민등록번호 검증을 모두 하였을 경우
	  	target.disabled = false; // 가입 버튼의 disabled를 해제(가입 버튼 활성화)
      	document.getElementById('joinCheck').className = "btn-join";
      }
}
	
function btnDisabled()  {
	  const target = document.getElementById('joinCheck'); // 가입 버튼의 정보를 가져옴
	  target.disabled = true; // 가입 버튼의 disabled를 활성화(가입 버튼 비뢀성화)
	  document.getElementById('joinCheck').className = "btn-join-none";
}

function email_change() { // 이메일 직접입력 선택 시 입력창 나오게 하기

	if (document.JOIN.email.options[document.JOIN.email.selectedIndex].value == '') { // 선택하세요 항목을 골랐을 경우
		document.JOIN.email2.disabled = true; // 직접 적는 항목을 비활성화하고
		document.JOIN.email2.value = ""; // 직접 적는 부분의 값을 빈칸으로 설정
	}
	if (document.JOIN.email.options[document.JOIN.email.selectedIndex].value == '9') { // 직접 입력을 골랐을 경우
		document.JOIN.email2.disabled = false; // 직접 적는 항목을 활성화하고
		document.JOIN.email2.value = ""; // 직접 적는 부분의 값을 빈칸으로 설정
		document.JOIN.email2.focus(); // 직접 적는 항목을 앞으로 보이게 함
	} else { // 다른 항목들을 골랐을 경우
		document.JOIN.email2.disabled = true; // 직접 적는 칸을 비활성화 하고
		document.JOIN.email2.value = document.JOIN.email.options[document.JOIN.email.selectedIndex].value; // 선택한 값을 그대로 나오게 함
	}

}

function noSpaceForm(obj) { // 공백을 지워버리기 위한 메소드
    var str_space = /\s/;  // 공백이 있나 체크
    if(str_space.exec(obj.value)) { //공백 체크
        obj.focus();
        obj.value = obj.value.replace(/\s| /gi,''); // 공백제거
        return false;
    }
}

function join_suc() { // 회원가입 시 축하 메시지와 초기 화면으로 이동
	alert("회원가입을 축하합니다!"); // 회원가입 축하합니다의 경고문 출력
	location.href ='index.jsp'; // index.jsp로 이동
}
</script>
</head>
<body>
	<div id="logo">
	 <a href="./index.jsp"><img src="/member/images/Feedback_logo.png"/></a>
	</div>
	
	<input type="button" class="sub-btn" value="로그인 페이지로 돌아가기" onclick = "location.href = '/member/index.jsp'">
	<input type="button" class="sub-btn" value="회원 가입 !" onclick = "location.href = '/member/join.jsp'">
	
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-newsletter">
		<div class="modal-content">
		
				<div class="modal-header">
					<div class="icon-box mx-auto">						
						<i class="fa fa-envelope-open-o"></i>
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span>&times;</span></button>
				</div>
				<div class="modal-body text-center">
					<h4>회원이 되어보세요!</h4>	
					<p>회원 관리 시스템 beta 서비스의 회원이 되어주세요! 추후 업데이트를 통해 다양한 서비스들을 체험해 보실 수 있습니다.</p>
					
<!-- 우리가 작성한 회원가입 양식 시작 -->		
<fieldset>
	<form name="JOIN" action="./mem_models/member_dao.jsp" method="post"> <!--form 태그안에 있는 버튼 클릭시 member_dao로 이동-->
		<ul> <!--리스트 생성-->
			<li>
				<label class="new" for="new_name">이름</label>
				<input type="text" class="name-form" id="new_name" name="username" size= "30" placeholder="" onchange="noSpaceForm(this);" required> <!--required는 빈칸이 있으면 가입 못하게 하기 위한 항목, onchange 태그로 항상 공백은 제거-->
			</li>
			<li>
				<label class="new" for="new_RRN">주민번호</label>
				<input type="text" class="RRN-form" id="RRN1" name="RRN1" size= "10" pattern="[0-9]+" onchange="noSpaceForm(this);" onkeyup="juminCheck();" maxlength="6" required> <strong>-</strong> <input type="password" class="RRN-form" id="RRN2" name="RRN2" size="10" onchange="noSpaceForm(this);" maxlength="7" require>
				<input type="button" class="mybtn" value="주민등록번호 확인" onclick="juminOk()"/>	<!--required는 빈칸이 있으면 가입 못하게 하기 위한 항목, onchange 태그로 항상 공백은 제거, 주민번호확인을 누르면 검증을 위한 jumin 메소드 실행-->
				<input type="hidden" id ="RRNNull" value="0">
			</li>
			<li>
				<label class="new" for="new_id">아이디</label>
				<input type="text" class="username_input" name="userid" onchange="noSpaceForm(this);" onkeydown="inputIdChk()" placeholder="6 ~ 12자 사이" onfocus="this.placeholder = ''" onblur="this.placeholder = '6 ~ 12자 사이'"required  />
				<input type="button" class="mybtn" onclick="fn_idcheck()" value="중복 확인" id="btn_idcheck"> <!--required는 빈칸이 있으면 가입 못하게 하기 위한 항목, onchange 태그로 항상 공백은 제거, 중복확인을 누르면 검증을 위한 fn_idcheck 메소드 실행-->
				<input type="hidden" id ="idNull" value="0">
		
				<img id="id_check_sucess" style="display: none;">
			</li>
			<li>
				<label class="new" for="passwd">비밀번호</label>
				<input type="password" class="pw-form" id="pw" name="passwd" size= "30" placeholder="비밀번호를 입력해 주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호를 입력해 주세요'" onchange="noSpaceForm(this);" required>
				<input type="hidden" id ="pwNull" value="0"> <!--required는 빈칸이 있으면 가입 못하게 하기 위한 항목, onchange 태그로 항상 공백은 제거-->
			</li>
			<li>
				<label class="new" for="passwdCheck">비밀번호 확인</label>
				<input type="password" class="pw-form" id="pw2" name="passwdCheck" size= "30" placeholder="비밀번호를 한 번 더 입력해 주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호를 한 번 더 입력해 주세요'" onchange="noSpaceForm(this); check_pw();" required>&nbsp;<span id="check"></span>
				<!--비밀번호 확인에 값을 적었을 시 뒤에 비밀번호 비교 결과를 적기위한 check_pw 메소드를 실행-->
			</li>
			<li>
				<div class="email">
				<label class="new">e-mail</label>
				<input type="text" class="email-form" name="email1" value="" onfocus="this.value='';" onchange="noSpaceForm(this);" required> @ <input type="text" class="email-form" name="email2" value="" placeholder="도메인 선택" disabled >
				<select name="email" class="email-select" onchange="email_change()"> <!--선택한 옵션의 값에 따라 다양한 결과 적용(email_change 메소드 실행)-->
		    		<option value="" >선택하세요</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>	
					<option value="gmail.com">gmail.com</option>		
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
				    <option value="9">직접입력</option>
				</select>
				</div>
			</li>
			<br/>
			<li>
				<label class="new" for="new_phone">전화번호</label> <!--전화번호 각 칸 별로 최대길이를 지정해 더 길게는 못쓰게 설정-->
				<input type="text" class="ph-form" autocomplete="on" name="phone1" size="5" onchange="noSpaceForm(this);" maxlength="3" required> <strong>-</strong>
				<input type="text" class="ph-form" autocomplete="on" name="phone2" size="5" onchange="noSpaceForm(this);" maxlength="4" required> <strong>-</strong>
				<input type="text" class="ph-form" autocomplete="on" name="phone3" size="5" onchange="noSpaceForm(this);" maxlength="4" required>
			</li>	
		</ul>

		<input type="hidden" name ="actionType" value = "JOIN">
		<input id="joinCheck" class="btn-join-none" type="submit" value="회원 가입" onclick="return confirm('가입하시겠습니까?')" disabled>
		<input type="button" class="btn-cancel" value="취소" onclick = "location.href ='index.jsp'"> <!--취소 버튼을 누르면 index.jsp로 되돌아감-->
	</form>		
</fieldset>
<!-- 양식 끝 -->					
				</div>		
		</div>
	</div>
</div>
</body>
</html>