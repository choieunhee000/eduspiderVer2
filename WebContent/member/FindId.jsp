<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FindId.jsp</title>
<link rel="stylesheet" type="text/css" href="FindId.css">

</head>
<body>	
	<div class="form signup">
		<div class="form-header">
			<div class="show-signup">아이디 찾기</div>
			<div class="show-reset">비밀번호 재설정</div>
		</div>
		<form id="myForm" action="./FindIdProc.jsp" method="post" onsubmit="return validatePassword();">
			<div class="arrow"></div>
			<div class="form-elements">
				<div class="form-element">
					<input type="text" name="name" placeholder="이름을 입력하세요">
				</div>
				<div class="form-element">
					<input type="email" name="email" placeholder="이메일을 입력하세요">
				</div>
				<div class="form-element">
					<input type="text" name="id" placeholder="아이디를 입력하세요">
				</div>
				<div class="form-element">
					<input type="password" name="password" id="password" placeholder="변경할 비밀번호를 입력하세요">
				</div>
				<div class="form-element">
					<input type="password" id="confirmPassword" placeholder="비밀번호를 한번 더 입력하세요">
				</div>
				<div class="form-element">
					<input type="submit" id="submit-btn" value="아이디 찾기">
				</div>
			</div>
		</form>
	</div>
	<script>
		function resetClass(element, classname){
			  element.classList.remove(classname);
		}
		document.getElementsByClassName("show-signup")[0].addEventListener("click",function(){
			let form = document.getElementsByClassName("form")[0];
			resetClass(form, "reset");
			form.classList.add("signup");
			document.getElementById("submit-btn").value = "아이디 찾기";
		 	document.getElementById("myForm").action = "./FindIdProc.jsp";
			document.getElementById("myForm").onsubmit = "";
		});
		document.getElementsByClassName("show-reset")[0].addEventListener("click",function(){
			let form = document.getElementsByClassName("form")[0];
			resetClass(form, "signup");
			form.classList.add("reset");
			document.getElementById("submit-btn").value = "비밀번호 재설정";
			document.getElementById("myForm").action = "./ResetPwdProc.jsp";
		});
		
		function validatePassword() {
			var password = document.getElementById('password').value;
			var confirmPassword = document.getElementById('confirmPassword').value;
			
			if(password != confirmPassword) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}			
			return true;
		}
	</script>
</body>
</html>