<%@page import="board_ver3.TemporaryBoardDAO"%>
<%@page import="board_ver3.BoardDTO"%>

<%@page import="category.CategoryDAO"%>
<%@page import="category.CategoryDTO"%>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.List"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

	String userId = request.getParameter("tablename");
	
	String id = (String)session.getAttribute("id");

	CategoryDAO cdao = new CategoryDAO();
	CategoryDTO cdto = new CategoryDTO();
	
	
	List<CategoryDTO> categoryList = cdao.getListDAO(id);
	
	for(CategoryDTO f : categoryList){	
		System.out.println("카테고리리스트"+f.getCategory());
	}
 	cdao.close(); 
	
	System.out.println(userId);

	TemporaryBoardDAO tdao = new TemporaryBoardDAO();
	
	
	List<BoardDTO> boardList = tdao.getListDAO(userId);
	
	int select = 0;
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>CrawlingTemporaryList</title>
	<link rel="stylesheet" href="../css/boardlist.css" />
</head>
<body>
<jsp:include page="../main/Header.jsp"></jsp:include>
  <form action="../crawling/CrawlingTemporaySelectProc.jsp" method="post">
  <div class="container2">
    <div class="row"> 
      <div class="col-lg-12"> 
        <div class="page-content">
			
          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em><%=boardList.get(0).getKeyword() %></em>를&nbsp;검색한 결과</h4>
                <select name="category" style="width: 200px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px; color: #333; background-color: #E1E987; float: right;">
                <%for(CategoryDTO dto : categoryList) {	%>
                	<option value="<%= dto.getCategory() %>"><%= dto.getCategory() %></option>
               		<%System.out.println("카테고리리스트" + dto.getCategory()); %>
                <% }%>
                </select> 
              </div>
              <div class="item">
                <ul>
                  <li><h4>#</h4></li>
                  <li class="li-short"><h4>keyword</h4></li>
                  <li class="li-short"><h4>site</h4></li>
                  <li class="li-normal"><h4>title</h4></li>
                  <li class="li-long"><h4>content</h4></li>
                  <li class="li-long"><h4>URL</h4></li>
                <!--   <li class="li-short"><h4>check</h4></li> -->
                </ul>
              </div>
              
              <% for (BoardDTO dto: boardList) { %>
              <div class="item">
                <ul>
                  <li><h4><%=dto.getNum() %></h4><input type="checkbox" name="num" value="<%=dto.getNum()%>"/></li>
                  <li class="li-short"><span><%=dto.getKeyword() %></span></li>
                  <li class="li-short"><span><%=dto.getSite() %></span></li>
                  <li class="li-normal"><span><%=dto.getTitle() %></span></li>
                  <li class="li-long"><span><%=dto.getContent() %></span></li>
                  <li class="li-long"><a href="<%= dto.getLink() %>"><span><%= dto.getLink() %></span></a></li>
                 <%--  <li class="li-short"><i
                 nput type="checkbox" name="crawlingNum" value="<%=dto.getNum()%>"/></li> --%>
                </ul>
              </div>
              <% } %>
            </div>
          </div>
          <!-- ***** Gaming Library End ***** -->
            <div class="col-lg-12">
           <div class="main-button"> 
            <input type="submit" value="select"/>
         </div>
      </div>
      
    </div>
  </div>
  </div>
  </div>
  </form>
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Made By 최은희 조병준 김민정
          
          <br>이곳은 일단 미정</p>
        </div>
      </div>
    </div>
  </footer>
<% tdao.close();  %>




</body>
</html>