<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/header.css" />
<title>JSP 게시판 웹 사이트</title>




</head>
<%
	String id = (String)session.getAttribute("id");
	MemberDAO mDao = new MemberDAO();
	MemberDTO mDto = new MemberDTO();

	if (id != null){
		mDto = mDao.selectMember(id);
	}
%>
<body>
     <!-- navigation 하나의 웹사이트의 전반적인 것을 보여줌  --> 
     <nav class="navbar navbar-default">
         <!-- header라는 것은 홈페이지의 로고 같은 것을 담는 영역을 말함 -->
         <div class="navbar-header">

             <a class="navbar-brand" href="../main/MainForm.jsp?page=1"><img src="../img/spider-web.png" alt="" /><span>EduSpider</span></a>
         </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="../main/MainForm.jsp?page=1">Home</a></li>
            <li class="dropdown">
            <% if (id == null) { %>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    접속 <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="../member/LoginForm.jsp">로그인</a></li>
                    <li><a href="../member/SignUp.jsp">회원가입</a></li>
                </ul>
            <% } else { %>
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                     <%=mDto.getNickname() %><span class="caret"></span></a>
                <ul class="dropdown-menu">
                	<li><a href="../profile/Profile.jsp">프로필</a></li>
                    <li><a href="../member/Logout.jsp">로그아웃</a></li>
                    <% System.out.println(request.getRequestURI()); %>
                    <% if (mDto.getGrade().equals("manager")) { %>
                    	<% if (request.getRequestURI().equalsIgnoreCase("/Hellow_World/manage/ManageForm.jsp")) { %>
                    		<li><a href="../main/MainForm.jsp?page=1">사용자 페이지로 이동</a></li>  
                    	<% } else if (request.getRequestURI().equalsIgnoreCase("/Hellow_World/main/MainForm.jsp")) { %>
                    		<li><a href="../manage/ManageForm.jsp?page=1&searchId=NULL">관리자 페이지로 이동</a></li>  
                    	<% } %>
                    <% } %>
                    <li><a href="../member/RemoveMember.jsp">회원탈퇴</a></li>
                </ul> 	
            <% } %>
            </li>
        </ul> 
     </nav>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
</body>
</html>