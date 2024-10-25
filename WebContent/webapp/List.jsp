<%@ page import="java.util.List"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
<%@ page import="board.BoardTable"%>
<%@ page import="javax.servlet.ServletContext"%>

<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="common.JDBConnect"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyworD");

//DAO를 생성해 DB에 연결 
BoardDAO dao = new BoardDAO(application);

int totalCount = dao.selectCount(keyword);// 게시물 수 확인 
List<BoardDTO> boardLists = dao.selectList(totalCount, keyword);//게시물 목록 받기 
dao.close(); // DB 연결 닫기
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/List.css" type="text/css">
<link rel="stylesheet" href="css/All.css" type="text/css">
</head>
<body>
	<center>
		<h2 class="title">Crawling List</h2>
		<form action="Input_keyword.jsp" method="post">
			<input type="submit" value="HOME" class="button">
		</form>
		<!-- 게시물 목록 테이블(표) -->
		<table border="1" width="90%">
			<!-- 각 컬럼의 이름 -->
			<tr class="title_tr">
				<th width="10%">num</th>
				<th width="10%">site</th>
				<th width="10%">title</th>
				<th width="10%">content</th>
				<th width="10%">regdate</th>
				<th width="10%">link</th>
			</tr>
			<!-- 목록의 내용 -->

			<%
			if (boardLists.isEmpty()) {
				//게시물이 하나도 없을 때
			%>
			<tr>
				<td colspan="6" align="center" class="">등록된 데이터가 없습니다^^*</td>
			</tr>
			<%
			} else {
			//게시물이 있을 때 
			int virtualNum = 0;// 화면상에서의 게시물 번호 
			for (BoardDTO dto : boardLists) {
				virtualNum = totalCount--;//전체 게시물 수에서 시작해 1씩 감소
			%>
			<tr align="center">
				<td><%=virtualNum%></td>
				<!-- 게시물 번호 -->
				<td align="center"><%=dto.getSite()%></td>
				<td align="center"><%=dto.getTitle()%></td>
				<td align="center"><%=dto.getContent()%></td>
				<td align="center"><%=dto.getRegdate()%></td>
				<td align="center"><%=dto.getLink()%></td>
			</tr>
			<%
			//}
			}
			}
			%>
		</table>
	</center>
</body>
</html>