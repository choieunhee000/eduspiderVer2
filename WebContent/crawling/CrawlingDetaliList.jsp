<%@page import="board_ver2.TemporaryBoardDAO"%>
<%@page import="board_ver2.BoardDTO"%>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.List"%> 



    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userId = request.getParameter("tablename");
	System.out.println(userId);

	TemporaryBoardDAO dao = new TemporaryBoardDAO();
	BoardDTO dto = new BoardDTO(); 
	
	List<BoardDTO> boardList = dao.getListDAO(userId);
	 
	

	
	%>
<from action="../crawling/CrawlingDetaliList.jsp">
<table>
	<tr>
		<th>num</th>
		<th>keyword</th>
		<th>site</th>
		<th>title</th>
		<th>content</th>
		<th>link</th>
		<th><input type="submit" value="select"/></th>
	</tr>
	

	<% for(BoardDTO f : boardList){
		%>
		<tr>
			<td><%= f.getNum() %></td>
	        <td><%= f.getKeyword() %></td>
	        <td><%= f.getSite() %></td>
	        <td><%= f.getTitle() %></td>
	        <td><%= f.getContent() %></td>
	        <td><%= f.getLink() %></td>
	        <<td><input type="checkbox" name="<%= f.getNum() %>"/></td>
		</tr>
		<% 
	}
	
	%>
</table>	
</from>
</body>
</html>