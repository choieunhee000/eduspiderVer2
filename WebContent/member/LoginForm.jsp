<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="test.css">
</head>
<body>
	<div id="container" class="container">
	    <!-- FORM SECTION -->
	    <div class="row">
	        <!-- SIGN UP -->
	        <div class="col align-items-center flex-col sign-up">    	
	        </div>
	        <!-- END SIGN UP -->
	        <!-- SIGN IN -->
	        <div class="col align-items-center flex-col sign-in">
	            <div class="form-wrapper align-items-center">
	                <div class="form sign-in">
	                	<form action="./LoginProc.jsp" method="post">
		                    <div class="input-group">
		                        <i class='bx bxs-user'></i>
		                        <input type="text" name="id" placeholder="아이디를 입력하세요" required>
		                    </div>
		                    <div class="input-group">
		                        <i class='bx bxs-lock-alt'></i>
		                        <input type="password" name="password" placeholder="비밀번호를 입력하세요" required>
		                    </div>
		                    <input type="submit" class="loginButton" value="로그인">
	                    </form>
	                    <p>
	                   		<a href="./FindId.jsp"><b>Forgot id or password?</b></a>
	                    </p>
	                    <p>
	                        <span>Don't have an account?</span>&nbsp;
	                        <a href="./SignUp.jsp"><b>Sign up here</b></a>
	                    </p>
	                </div>
	            </div>
	            <div class="form-wrapper">
	
	            </div>
	        </div>
	        <!-- END SIGN IN -->
	    </div>
	    <!-- END FORM SECTION -->
	    <!-- CONTENT SECTION -->
	    <div class="row content-row">
	        <!-- SIGN IN CONTENT -->
	        <div class="col align-items-center flex-col">
	            <div class="text sign-in">
	                <h2>
	                Welcome
	                </h2>
	            </div>
	            <div class="img sign-in">
	
	            </div>
	        </div>
	        <!-- END SIGN IN CONTENT -->	        
	    </div>
	    <!-- END CONTENT SECTION -->
	</div>
	<script>
	    let container = document.getElementById('container')
	
	    setTimeout(() => {
	    container.classList.add('sign-in')
	    }, 200)     
	</script>
</body>
</html>