<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.JSFunction"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="follow.FollowDTO"%>
<%@page import="follow.FollowDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="board_ver3.BoardDAO"%>
<%@page import="category.CategoryDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>

    <!-- Bootstrap core CSS -->
    <link href="../css2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../css2/assets/css/fontawesome.css">
    <link rel="stylesheet" href="../css2/profile.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css2/assets/css/owl.css">
    <link rel="stylesheet" href="../css2/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
     
</head>

<%
	// id 세션 변수에 값 확인 후 값이 있을 시 정보 호출
	String myId = (String)session.getAttribute("id");
	System.out.println(myId);
	
	// 로그인을 안했을 시 로그인 하라는 문구를 출력한 후 로그인 페이지로 강제 이동
	if(myId == null){
		PrintWriter script = response.getWriter();
		script.println(JSFunction.executeAlert("로그인 후 이용해주세요",	"../member/LoginForm.jsp"));
		script.close();
	}
     /* 
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	dto = dao.selectMemberProfile(myId); 
	
	
	System.out.println("해당유저의 프로필:"+dto.getProfileimg());
	 */
	/////////
	
	 
	// 내 계정과 관련된 팔로우 관계 전부 추출
	FollowDAO fDao = new FollowDAO();
	ArrayList<FollowDTO> followList = fDao.selectFollowAll(myId);

	// 내 계정과 관련 정보를 전부 추출
	MemberDAO mDao = new MemberDAO();
	MemberDTO myDto = mDao.selectMember(myId);

	// 내 계정의 한줄 말이 없을 경우 "한 줄 입력 필요" 문구로 변경
	if (myDto.getComment() == null){
		myDto.setComment("한 줄 입력 필요!!");
	}
  
	// 크롤링 수 regidate로 가져오기
	BoardDAO bDao = new BoardDAO();
	int crawlingCount = bDao.selectRegidateCount(myId);
	bDao.close();
 
	// 카테고리 수 가져오기
	CategoryDAO cDao = new CategoryDAO();
	int categoryCount = cDao.selectCategoryCount(myId);
	cDao.close();

	// 팔로잉 수 체크하기
	int followingCount = fDao.selectFollowingCount(myId);

	
%>


<body>
<div class="main-header">
	<a href="../main/MainForm.jsp?page=1"><img src="../img/spider-web.png" alt="" /><span>EduSpider</span></a>
	<ul>
		<li><a href="../main/MainForm.jsp?page=1">Home</a></li>
	</ul>
</div>
 	
  <div class="container2"> 
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content2">

          <!-- ***** Banner Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="main-profile">
                <div class="row">               	
	                  <div class="col-lg-4 main-img">
                  		<img src="<%=myDto.getProfileimg() %>" alt="" style="border-radius: 23px;">
		                <div class="sub-button">
		                 	<a href="#none" onclick="window.open('../profile/popup_profile.jsp','new','scrollbars=yes,resizable=no width=600 height=700, left=0,top=0');return false">수정</a>
		                </div>
	                  </div>
                 	<div class="col-lg-8 align-self-center">
                    <div class="main-info header-text">
                      <span><%=myDto.getNickname() %></span>
                      <p><%=myDto.getComment() %></p>
                       
                      
                      <div class="counter">
                      	<div>
                      		<ul>
		                      <li><h3>크롤링 수</h3></li>
		                      <span><%=crawlingCount %></span>
		                    </ul>
                      	</div>
                      	<div>
                      		<ul>
		                      <li><h3>카테고리수</h3></li>
		                      <span><%=categoryCount %></span>
		                    </ul>
                      	</div>
                      	<div>
                      		<ul>
		                      <li><h3>친구 수</h3></li>
		                      <span><%=followingCount %></span>
		                    </ul>
                      	</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Banner End ***** -->

          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <form action="../profile/FollowerProc.jsp" method="post">
              <div class="heading-section">
              	<div class="h4-name"> 
               	 <h4><em>팔로잉</em> 목록</h4>
                </div>                
                <div class="input-group"><input type="text" name="followId" placeholder="아이디를 입력하세요"/></div>
				<div class="main-button"><input type="submit" value="팔로우"/></div>             
              </div>
               	</form>
                <!-- 반복문 시작 -->
              <%
                int count = 0;
              	for (FollowDTO dto: followList) {
            	    // 위에서 가져온 필로우 리스트에서 각 상대 id에 해당하는 정보를 MemberDTO에 저장
            	 	MemberDTO followDto = mDao.selectMember(dto.getFollowId());
            	 	
            	    if (followDto.getComment() == null){
            	    	followDto.setComment("한 줄 입력 필요!!");
            	 	}
            	    
            	    if (dto.getFollowing() != null) {
			  %>
               		
               		
         
              <div <% if (count == followList.size() - 1) { %>class="item last-item"<% } else { %>class="item"<% } %>>
                <ul>
                  <li><img src="../images/spider-01.PNG" alt="" class="templatemo-item"></li>
                  <li><h4>닉네임</h4><span><%=followDto.getNickname() %></span></li>
                  <li><h4>자기소개 한 줄</h4><span><%=followDto.getComment() %></span></li>
                  <li><h4>이메일</h4><span><%=followDto.getEmail() %></span></li>
                  <li>
                  
                  	<div class="main-border-button border-no-active">
	                  	<a href="../profile/FollowerCategory.jsp?page=1&followId=<%=followDto.getId() %>&nickname=<%=followDto.getNickname()%>">글보기</a> 
            
	                  
                  	</div>
                  	
                  </li>
                  <li>
                  	<div class="main-border-button border-no-active">
                  		<a href="../profile/FollowerDeleteProc.jsp?followId=<%=followDto.getId() %>">언팔로우</a>
                  	</div>
                  </li>
                </ul>
              </div>
              <%   }
              		count++; 
              	} %>
              <!-- 반복문 종료 -->
              
              
              
            </div>
          </div>
          <!-- ***** Gaming Library End ***** -->
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



  </body>
</html>