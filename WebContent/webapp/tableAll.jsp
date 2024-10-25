<%@ page import = "java.util.List" %>
<%@ page import = "board.AllTableDAO" %>
<%@ page import = "board.AllTable" %>
<%@ page import = "javax.servlet.ServletContext" %>

<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "common.JDBConnect" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//DAO를 생성해 DB에 연결 
AllTableDAO dao = new AllTableDAO(application);


int totalCount = dao.searchAllTable();// 게시물 수 확인 
List<AllTable> allTable = dao.selectList(totalCount);//게시물 목록 받기 
dao.close(); // DB 연결 닫기
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/AllTable.css" type="text/css">
<link rel="stylesheet" href="css/All.css" type="text/css">
<title>Insert title here</title>
</head>
<body>	
	<center>
	<h2 class="title">Crawling All List</h2>
	<form action="Input_keyword.jsp" method="post">
				<input type="submit" value="HOME" class="button">
	</form>
	
	<!-- 게시물 목록 테이블(표) -->
	<table border="1">
	<!-- 각 컬럼의 이름 -->
	<tr>
		<th class="num_title">num</th>
		<th class="keyword_title">keyword</th>
	</tr>
	<!-- 목록의 내용 -->
	
<%
if(allTable.isEmpty()){
	//게시물이 하나도 없을 때 
%>
	<tr>
		<td colspan="5" align="center">
			등록된 테이블이 없습니다^^*
		</td>
	</tr>
<%
}
else{
	//게시물이 있을 때 
	int virtualNum = 0;// 화면상에서의 게시물 번호 
	for(AllTable dto : allTable)
	{
		virtualNum = totalCount--;//전체 게시물 수에서 시작해 1씩 감소 
%>
		<tr align="center">
			<td><%= virtualNum %></td> <!-- 게시물 번호 -->
			<td align="center"><%= dto.getTable() %></td>
		</tr>
<%
	}
}
%>
	</table>
	
	</center>
</body>
</html>