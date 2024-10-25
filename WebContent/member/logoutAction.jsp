<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board_ver3.TemporaryBoardDAO"%>
<%@page import="board_ver3.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	String id = (String)session.getAttribute("id");
	TemporaryBoardDAO dao = new TemporaryBoardDAO();
 	dao.dropTemporaryDAO(id);
 %>
 
   
 <% 
 	session.invalidate();  //세션 데이터 해체 
 %>
	<script>
	 location.href = '../member/LoginForm.jsp';
	</script>
</body>
</html>