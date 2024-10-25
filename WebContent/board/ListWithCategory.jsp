<%@page import="board_ver3.BoardDAO"%>
<%@page import="board_ver3.BoardDTO"%>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.List"%> 



    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>BoardList</title>
	<link rel="stylesheet" href="../css/boardlist.css" />
  </head>
</head>
<body>
<jsp:include page="../main/Header.jsp"></jsp:include>
<%
	//String userId = request.getParameter("tablename");
	
	//String userId = "alice123";
	int delete = 1;
	String category = request.getParameter("category");
	String id = (String)session.getAttribute("id");
	//System.out.println(userId);
	String followId = request.getParameter("followId");
	if(!(followId.equals("null"))){
		id = followId;
		delete = 0; //팔로우 영역 
	}

	BoardDAO dao = new BoardDAO();
	BoardDTO dto = new BoardDTO(); 
	
	List<BoardDTO> boardList = dao.getListWithCategoryDAO(id,category);
	 
	 

	
	%>
	
	
  <%
            	//페이지 번호를 받기 page = 1 
            	String pageString = request.getParameter("page");
               //String pageString = "1";
            	//왜인지는 모르겠지만 page라고 naming 할 수는 없음 
            	int currentPage = Integer.parseInt(pageString);
            	System.out.println("현재페이지 번호:" + currentPage);
            	
            	// 한 페이지에 보여줄 데이터 설정
            	int itemsPerPage = 10;
            	
            	// 데이터 조회를 위한 시작 인텍스와 종료 인덱스를 계산 -> 0
   				int startIndex = (currentPage - 1) * itemsPerPage;
            	int endIndex = startIndex + itemsPerPage -1;
            	
            	// 데이터베이스의 저장된 데어터 개수 계산;
            	int totalItems = dao.getCountWithCategoryDAO(category,id);
            	
            	// 전체 페이지 개수를 계산
            	int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
            	
            	// 페이지 범위를 초과한 경우, 현재 페이지를 조정
            	if (currentPage > totalPages){
            		currentPage = totalPages;
            		
            		startIndex = (currentPage - 1) * itemsPerPage;
            		endIndex = startIndex + itemsPerPage - 1;         		
            		 
            	}
            	 System.out.println("시작 인덱스: " + startIndex);
                 System.out.println("종료 인덱스: " + endIndex);
                 
                 ArrayList<BoardDTO> arr;    
                 arr = dao.selectBoard(id,category,startIndex, endIndex + 1);
                 dao.close();
                 
              // count를 이용해서 startIndex부터 endIndex까지의 데이터의 개수만큼 추출
                 int count = startIndex;
               
            	
            %>

<form action="../board/DeleteListWithCategoryProc.jsp" method="get">
<div class="container2">
    <div class="row"> 
      <div class="col-lg-12"> 
        <div class="page-content">
		<input type="hidden" name="category" value="<%=category %>" />
          <!-- ***** Category Library Start ***** -->
          <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4>category: <em><%=category %></em></h4>
              </div>
              <div class="item">
                <ul>
                  <li><h4>#</h4></li>
                  <li class="li-short"><h4>keyword</h4></li>
                  <li class="li-short"><h4>site</h4></li>
                  <li class="li-normal"><h4>title</h4></li>
                  <li class="li-long"><h4>content</h4></li>
                  <li><h4>URL</h4></li>
                </ul>
              </div>
              
            <%// boardList
              for(BoardDTO f : arr){%>
              <div class="item">             
                <ul>
                  <li><h4><%= f.getNum() %></h4>
                  <%if(delete == 1) { %>
                  <input type="checkbox" name="num" value="<%=f.getNum()%>"/>
                   <% } %>
                  </li>
                  <li class="li-short"><span><%= f.getKeyword() %></span></li>
                  <li class="li-short"><span><%= f.getSite() %></span></li>
                  <li class="li-normal"><span><%= f.getTitle() %></span></li>
                  <li class="li-long"><span><%= f.getContent() %></span></li>          		
                   <li class="li-long"><a href="<%= f.getLink() %>"><span><%= f.getLink() %></span></a></li>
                  		
                </ul>
              </div>
            <% System.out.println(count);
    		if(count == endIndex || count >= totalItems)
    			break;
    		
    		count++;
            
              } %>  
            
            
        
            </div>
          </div>
          
           <!-- 페이징 처리 -->
                <div class="font-bold text-sm main-button">
				    <%-- 이전 페이지 버튼 --%>
				    <a href="./ListWithCategory.jsp?page=<%=currentPage - 1 %>&category=<%= category %>"
				       class="px-3 py-1 bg-blue-500 text-white font-semibold rounded-md <%= (currentPage == 1) ? "opacity-50 cursor-not-allowed" : "" %>">
				        이전
				    </a>
				
				    <%-- 페이지 번호 버튼 --%>
				    <% for (int i = 1; i <= totalPages; i++) { %>
				        <a href="./ListWithCategory.jsp?page=<%=i %>&category=<%= category %>"
				           class="px-3 py-1 mx-1 bg-blue-500 text-white font-semibold rounded-md <%= (currentPage == i) ? "bg-blue-700" : "" %>">
				            <%=i %>
				        </a>
				    <% } %>
				
				    <%-- 다음 페이지 버튼 --%>
				    <a href="./ListWithCategory.jsp?page=<%=currentPage + 1 %>&category=<%= category %>"
				       class="px-3 py-1 bg-blue-500 text-white font-semibold rounded-md <%= (currentPage == totalPages) ? "opacity-50 cursor-not-allowed" : "" %>">
				        다음
				    </a>
				</div>
          
          
          
          <!-- ***** Category Library End ***** -->
           
            <%if(delete == 1) { %>
           <div class="col-lg-12">
           <div class="main-button"> 
            <input type="submit" value="delete"/>
         </div> 
      </div>
         <% } %>
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


<% dao.close();  %>


	

</body>
</html>