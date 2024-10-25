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
			<div class="show-signup">���̵� ã��</div>
			<div class="show-reset">��й�ȣ �缳��</div>
		</div>
		<form id="myForm" action="./FindIdProc.jsp" method="post" onsubmit="return validatePassword();">
			<div class="arrow"></div>
			<div class="form-elements">
				<div class="form-element">
					<input type="text" name="name" placeholder="�̸��� �Է��ϼ���">
				</div>
				<div class="form-element">
					<input type="email" name="email" placeholder="�̸����� �Է��ϼ���">
				</div>
				<div class="form-element">
					<input type="text" name="id" placeholder="���̵� �Է��ϼ���">
				</div>
				<div class="form-element">
					<input type="password" name="password" id="password" placeholder="������ ��й�ȣ�� �Է��ϼ���">
				</div>
				<div class="form-element">
					<input type="password" id="confirmPassword" placeholder="��й�ȣ�� �ѹ� �� �Է��ϼ���">
				</div>
				<div class="form-element">
					<input type="submit" id="submit-btn" value="���̵� ã��">
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
			document.getElementById("submit-btn").value = "���̵� ã��";
		 	document.getElementById("myForm").action = "./FindIdProc.jsp";
			document.getElementById("myForm").onsubmit = "";
		});
		document.getElementsByClassName("show-reset")[0].addEventListener("click",function(){
			let form = document.getElementsByClassName("form")[0];
			resetClass(form, "signup");
			form.classList.add("reset");
			document.getElementById("submit-btn").value = "��й�ȣ �缳��";
			document.getElementById("myForm").action = "./ResetPwdProc.jsp";
		});
		
		function validatePassword() {
			var password = document.getElementById('password').value;
			var confirmPassword = document.getElementById('confirmPassword').value;
			
			if(password != confirmPassword) {
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				return false;
			}			
			return true;
		}
	</script>
</body>
</html>