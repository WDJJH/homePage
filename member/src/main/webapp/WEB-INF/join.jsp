<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function fn_idcheck() { // 아이디 중복 체크
	var userid = document.JOIN.userid.value;
	if(userid == "") {
		alert("아이디를 입력해 주세요!");
		document.JOIN.userid.focus();
		return false;
	}
	if(userid.length < 6 || userid.length > 12) {
		alert("아이디를 사용하실 수 없습니다.");
		document.JOIN.userid.focus();
		return false;
	}
	var url = "idcheck.jsp?userid="+userid;
	document.getElementById('idNull').value = "1";
	window.open(url, "중복 아이디 체크", "width=300, height=200");
}


function juminOk() { //주민번호 맨 끝자리(확인번호) 체크
    var check = [2,3,4,5,6,7,8,9,2,3,4,5];
    var jumin = JOIN.RRN1.value + JOIN.RRN2.value;
    var gopHap = 0;

    for(var i=0; i<12; i++) {
      gopHap += (check[i] * parseInt(jumin.charAt(i)));
    }
    var juminNa = gopHap % 11;
    var checkdigit = 11 - juminNa;

    if(checkdigit == jumin.substring(jumin.length-1)) {
      alert("주민번호 확인 완료.");
      document.getElementById('RRNNull').value = "1";
    }
    else {
      alert("주민번호가 틀렸습니다.");
    }
  }

function check_pw(){
	 
    var pw = document.getElementById('pw').value;

    if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pw2').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
            btnActive();
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
            btnDisabled();
        }
    } else {
    	btnDisabled();
    }
}
function btnActive()  {
	  const target = document.getElementById('a');
	  target.disabled = false;
}
	
function btnDisabled()  {
	  const target = document.getElementById('a');
	  const target_2 = document.getElementById('RRNNull').value;
	  const target_3 = document.getElementById('idNull').value;
	  if (target_2 != "0" && target_3 != "0")
	  	target.disabled = true;
}

function email_change() { // 이메일 직접입력 선택 시 입력창 나오게 하기

	if (document.JOIN.email.options[document.JOIN.email.selectedIndex].value == '') {
		document.JOIN.email2.disabled = true;
		document.JOIN.email2.value = "";
	}
	if (document.JOIN.email.options[document.JOIN.email.selectedIndex].value == '9') {
		document.JOIN.email2.disabled = false;
		document.JOIN.email2.value = "";
		document.JOIN.email2.focus();
	} else {
		document.JOIN.email2.disabled = true;
		document.JOIN.email2.value = document.JOIN.email.options[document.JOIN.email.selectedIndex].value;
	}

}

function noSpaceForm(obj) { // 공백 사용 X
    var str_space = /\s/;  // 공백이 있나 체크
    if(str_space.exec(obj.value)) { //공백 체크
        obj.focus();
        obj.value = obj.value.replace(/\s| /gi,''); // 공백제거
        return false;
    }
}
</script>
</head>
<body>
<table>
 <tr>
	 <td><img src="/member01/images/yju_logo_01.png"/></td> 
	 <td width="400" align="center"><h1>회원관리 시스템 V0.1</h1></td> 
</tr>
</table>
<fieldset>
<legend> 회원가입 </legend>
	<form name="JOIN" action="./mem_models/member_dao.jsp" method="post">     
	<input type="hidden" name="chk" value="0"> 
<ul>
	<li>
		<label class="new" for="new_name">이름</label>
		<input type="text" id="new_name" name="username" size= "30" onchange="noSpaceForm(this);" required>
	</li>
		<li>
		<label class="new" for="new_RRN">주민번호</label>
		<input type="text" id="RRN1" name="RRN1" size= "10" pattern="[0-9]+" onchange="noSpaceForm(this);" onkeyup="juminCheck();" maxlength="6" required>-<input type="password" id="RRN2" name="RRN2" size="10" onchange="noSpaceForm(this);" maxlength="7" require>
		<input type="button" value="주민번호확인" onclick="juminOk()"/>
		<input type="hidden" id ="RRNNull" value="0">
	</li>
	<li>
		<label class="new" for="new_id">아이디</label>
		<input type="text" class="username_input" name="userid" onchange="noSpaceForm(this);" onkeydown="inputIdChk()" required  />
		<input type="button" onclick="fn_idcheck()" value="중복확인" id="btn_idcheck">
		<input type="hidden" id ="idNull" value="0">
		(6자 ~ 12자 사이)
		
<img id="id_check_sucess" style="display: none;">
	</li>
	<li>
		<label class="new" for="passwd">비밀번호</label>
		<input type="password" id="pw" name="passwd" size= "30" onchange="noSpaceForm(this);" required>
	</li>
	<li>
		<label class="new" for="passwdCheck">비밀번호 확인</label>
		<input type="password" id="pw2" name="passwdCheck" size= "30" onchange="noSpaceForm(this); check_pw();" required>&nbsp;<span id="check"></span>
	</li>
	<li>
		<label class="new">e-mail</label>
		<input type="text" name="email1" value="" onfocus="this.value='';" onchange="noSpaceForm(this);" required>@<input type="text" name="email2" value="" disabled >
		<select name="email" onchange="email_change()">
		    <option value="" >선택하세요</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>		
			<option value="gmail.com">gmail.com</option>		
			<option value="hanmail.net">hanmail.net</option>
			<option value="nate.com">nate.com</option>
		    <option value="9">직접입력</option>
		</select>
	</li>
	<li>
		<label class="new" for="new_phone">전화번호</label>
		<input type="text" id="new_phone" name="phone" size= "30" autocomplete="on" onchange="noSpaceForm(this);" required>		
	</li>	
</ul>

	<input type="hidden" name ="actionType" value = "JOIN">
	<input id="a" type="submit" value="가입" disabled>
	<input type="button" value="취소" onclick = "location.href = 'index.jsp'">
	</form>		
</fieldset>
<%@ include file="../footer.jsp" %>
</body>
</html>