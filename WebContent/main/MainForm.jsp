<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="category.CategoryDAO"%>
<%@page import="category.CategoryDTO"%>

<%@page import="member.MemberDAO"%>

<%@page import="member.MemberDTO"%>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.List"%> 


<head> 

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Main</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

  </head>
  
 <%
 
	
	CategoryDAO dao = new CategoryDAO();
	CategoryDTO dto = new CategoryDTO(); 
	
	String userId = (String)session.getAttribute("id");
	List<CategoryDTO> kategorieList = dao.getListDAO(userId);
	
	MemberDAO mdao = new MemberDAO();
	MemberDTO mdto = mdao.selectMember(userId);
	mdao.close();
	 
%>

<body>
  <%@include file="../main/Header.jsp" %>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** Banner Start ***** -->
          <div class="main-banner">
            <div class="row">
              <div class="col-lg-7">
                <div class="header-text">
                  <h6>Welcome To EduSpider</h6>
                  <h4>Crawling <em>Here</em></h4><br>
                  <form action="../crawling/CrawlingTemporaryProc.jsp" method="post">
                    <div class="input-group">
                      <input style="width:150%;" type="text" name="keyword" placeholder="검색어">                   
                    </div>
                    <div class="main-button">
                      <input type="submit" value="Start Crawling">
                    </div>
                  </form>

                </div>
              </div>
            </div>
          </div>
          <!-- ***** Banner End ***** -->

          <!-- ***** Most Popular Start ***** -->
          <div class="most-popular">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4><em>Crawling</em> Categories</h4>
                </div>
                <div class="row">

                  <!-- Start category insert -->
                  <div class="col-lg-3 col-sm-6">
                    <a href="">
                    <div class="item_plus">
                      <a href="#none" onclick="window.open('../category/InsertCategoryForm.jsp','new','scrollbars=yes,resizable=no width=500 height=270, left=600,top=400');return false">
                      <img src="../img/plus3.png" alt="" style="margin-top:15px;"></a>
                    </div>
                  </a>
                  </div>
                  
                   <%if(userId!=null){ %>
	
                  <%
              
                
                 String pageString = request.getParameter("page");
                 
                  int currentPage = Integer.parseInt(pageString);
                  System.out.println("현재 페이지 번호: " + currentPage);

                  // 한 페이지에 보여줄 데이터 설정 / 첫페이지는 +버튼 떄문에 7개 
                  int itemsPerPage = 8;
                 if(currentPage==1){ 
                	 itemsPerPage = 7;  
                 }else{
                	 itemsPerPage = 7 + 4 * (currentPage -1);
                 }

                  // 데이터 조회를 위한 시작 인덱스와 종료 인덱스를 계산
                  int startIndex = 0;
                  int endIndex = startIndex + itemsPerPage - 1;
                  
                  
                  // 데이터베이스의 저장된 데이터 튜플 개수 계산
                  int totalItems = dao.getCountCategoryDAO(id);
  
                  // 전체 페이지 개수를 계산
                  int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
                  System.out.println("전체 페이지 개수: " + totalPages);

                  // 페이지 범위를 초과한 경우, 현재 페이지를 조정
                 /*  if (currentPage > totalPages) {
                      currentPage = totalPages;
                      startIndex = (currentPage - 1) * itemsPerPage;
                      endIndex = startIndex + itemsPerPage - 1;
                  } */
                  System.out.println("시작 인덱스: " + startIndex);
                  System.out.println("종료 인덱스: " + endIndex);
                  
                  //=========================================================
              
              	
              	// id의 값에 따라 해당하는 id의 데이터 전부 추출 후 ArrayList에 저장
                  ArrayList<CategoryDTO> arr;
              	 
              	// 감색한 게 없으면 데이터베이스에 있는 모든 정보 추출 후 ArrayList에 저장
              	
              		arr = dao.selectCategory(userId,startIndex, endIndex + 1);
                
              	dao.close();
              	
              	//===========================================================
                  
              	// count를 이용해서 startIndex부터 endIndex까지의 데이터의 개수만큼 추출
                  int count = startIndex;
              	for(CategoryDTO f: arr) {
                  
                  
                  
                  
                  
                  
                  
                  %>
                   
   
                           
                  <!-- Start category view -->
                  <div class="col-lg-3 col-sm-6">
                    <div class="item">
                      <div class="category2">
                      <img src="<%=mdto.getProfileimg() %>" alt="">
                      <h4><%= f.getCategory() %></h4>
                      </div>
                      <div class="sub-button">
                        <a href="#none" onclick="window.open('../category/UpdateCategoryForm.jsp?category=<%= f.getCategory()%>','new','scrollbars=yes,resizable=no width=500 height=270, left=600,top=400');return false">
                        	수정
                        </a>
                        <a href="../category/DeleteCategoryProc.jsp?category=<%= f.getCategory() %>">삭제</a>
                        <a href="../board/ListWithCategory.jsp?page=1&category=<%= f.getCategory() %>&followId=null">글보기</a>
                      </div>
                    </div>
                  </div>
                  <!-- End category view -->
                  
                   
       	<% 
       /* 	System.out.println(count);
		if(count == endIndex || count >= totalItems)
			break;
		
		count++; */  
              	}%>           
                  
                  
                  <div class="col-lg-12">
                    <div class="main-button">
                  
                  <a href="../main/MainForm.jsp?page=<%=currentPage + 1 %>"
				       class="px-3 py-1 bg-blue-500 text-white font-semibold rounded-md">
				        더보기
				    </a>
                  </div>
                  </div>
                  


                </div>
              </div>
            </div>
          </div>
          <!-- ***** Most Popular End ***** -->
          
          <%} %>
        </div>
      </div>
    </div>
  </div>
  
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


  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="assets/js/isotope.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/tabs.js"></script>
  <script src="assets/js/popup.js"></script>
  <script src="assets/js/custom.js"></script>


  </body>

</html>
