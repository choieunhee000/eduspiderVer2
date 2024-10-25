<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet" type="text/css" href="test.css">
</head>
<body>
	<div id="container" class="container">
        <!-- FORM SECTION -->
        <div class="row">
            <!-- SIGN UP -->
            <div class="col align-items-center flex-col sign-up">
                <div class="form-wrapper align-items-center">
                    <div class="form sign-up">
                    	<form action="./SignUpProc.jsp" method="post" onsubmit="return validatePassword();">
	                        <div class="input-group">
	                            <i class='bx bxs-user'></i>
	                            <input type="text" name="name" placeholder="�̸��� �Է��ϼ���" required>
	                        </div>
	                        <div class="input-group">
	                            <i class='bx bxs-user'></i>
	                            <input type="text" name="id" placeholder="���̵� �Է��ϼ���" required>
	                        </div>
	                        <div class="input-group">
	                            <i class='bx bxs-lock-alt'></i>
	                            <input type="password" name="password" id="password" placeholder="��й�ȣ�� �Է��ϼ���" required>
	                        </div>
	                        <div class="input-group">
	                            <i class='bx bxs-lock-alt'></i>
	                            <input type="password" id="confirmPassword" placeholder="��й�ȣ�� �ѹ� �� �Է��ϼ���" required>
	                        </div>
	                        <div class="input-group">
	                            <i class='bx bxs-user'></i>
	                            <input type="text" name="nickname" placeholder="�г����� �Է��ϼ���" required>
	                        </div>
	                        <div class="input-group">
	                            <i class='bx bx-mail-send'></i>
	                            <input type="email" name="email" placeholder="�̸����� �Է��ϼ���" required>
	                        </div>
	                        <input type="submit" class="loginButton" value="ȸ������" />
	                        </form>
                        <p>
                            <span>Already have an account?</span>
                            <a href="./LoginForm.jsp"><b class="pointer">Sign in here</b></a>
                        </p>
                    </div>
                </div>

            </div>
            <!-- END SIGN UP -->
        </div>
        <!-- END FORM SECTION -->
        <!-- CONTENT SECTION -->
        <div class="row content-row">
            <!-- SIGN IN CONTENT -->
            <div class="col align-items-center flex-col">
                
            </div>
            
            <!-- END SIGN IN CONTENT -->
            <!-- SIGN UP CONTENT -->
            <div class="col align-items-center flex-col">
                <div class="img sign-up">
                </div>
                <div class="text sign-up">
                    <h2>
                    Join with us
                    </h2>
                </div>
            </div>
            <!-- END SIGN UP CONTENT -->
        </div>
        <!-- END CONTENT SECTION -->
    </div>
	<script>
	    let container = document.getElementById('container')
	
	    setTimeout(() => {
	    container.classList.add('sign-up')
	    }, 200)
	    
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