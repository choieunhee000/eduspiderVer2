<%@page import="category.CategoryDAO"%>
<%@page import="category.CategoryDTO"%>

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
	/* String userId = request.getParameter("tablename");
	System.out.println(userId); */

	CategoryDAO dao = new CategoryDAO();
	CategoryDTO dto = new CategoryDTO(); 
	
	String userId = (String)session.getAttribute("id");
	List<CategoryDTO> kategorieList = dao.getListDAO(userId);
	 
	/* num INT AUTO_INCREMENT PRIMARY KEY,
	  kategorie VARCHAR(300),
	  id VARCHAR(32), */

	//id 부분 출력은 나중에는 보이지 않도록 수정하기
%>
	

<!--카테고리 선택  -->
<form id="test" action="../crawling/CrawlingTemporayInsert.jsp"  method="get">
<table>
	<tr>
		<th>num</th>
		<th>kategorie</th>
		<th>id</th>
		<th>select</th>

	</tr>
	 

	<%
	 		for(CategoryDTO f : kategorieList){
	 	%>
		<tr>
			<td><%= f.getNum() %></td>
	        <td><%= f.getKategorie() %></td>
	        <td><%= f.getId() %></td>
	        <td><input type="radio" name="num" value="<%= f.getNum() %>"/></td>
		</tr>
		<% 
	}
	
	
	
	%>
	<tr>
		<td><input type="submit" value="select" /></td>
	</tr>
	
</table>
	
</form>

<br>
*-----------------------------------*
<br>
<br>

<!-- crawling 시작 부분 , insertcode로 따로 있음 /기능 구현을 위해 다 집어넣음  -->
<form id="test" action="../crawling/crawlingTemporaryProc.jsp" method="get">
	<h3>hi! I'm rooting for you, we're got it together..!</h3>
	<input type="text" name="keyword" value="what's wanna?"/> Let's start search information..!
	<input type="submit" value="StartCrawling" />
</form>
<br>
*-----------------------------------*
<br>


<!-- <div>
　<button type="submit" form="test" action="../crawling/Test.jsp" method="get">submit</button>
</div>  -->



<script>
    function submitInnerForm(value) {
      document.getElementById('selectedValue').value = value;
    }
  </script>



<!-- 카테고리 insert --> 

<form action="../crawling/CrawlingKategorieSelectProcInsert.jsp" method="get">
	<br>
	<h4>--새로운 카테고리 생성--</h4>
	카테고리:<input type="text" name="kategorie" value="inputNewKategorie" /> <br />
	<input type="submit" value="insertKategorie" />		
</form>



<!-- 카테고리 delete -->
<form action="../crawling/CrawlingKategorieSelectProcDelete.jsp" method="get">
	<br>
	<h4>--카테고리 삭제--</h4>
	카테고리:<input type="text" name="Dropkategorie" value="inputDropKategorie" /> <br />
	<input type="submit" value="DropKategorie" />		
</form>
<br>
*-----------------------------------*
<br>
<br>
<br>


</body>
</html>