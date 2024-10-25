<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.JSFunction"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="keywords" content="tailwind,tailwindcss,tailwind css,css,starter template,free template,admin templates, admin template, admin dashboard, free tailwind templates, tailwind example">
    
    <!-- Css -->
    <!--
    
    -->
    <link rel="stylesheet" href="../css/styles.css">
    <!--<link rel="stylesheet" href="../css/all.css">-->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i" rel="stylesheet">
    <title>관리자 페이지</title>
</head>

<body>
<jsp:include page="../main/Header.jsp"></jsp:include>
<!--Container -->
<%
	// id 세션변수 안에 있는 값 변수에 저장
	String id = (String)session.getAttribute("id");
	PrintWriter script = response.getWriter();
	System.out.println(id);

	// id 세션변수 안에 있는 값에 따라 제어
	if (id == null) {
		script.println(JSFunction.executeAlert("로그인 후 이용해주세요", "../member/LoginForm.jsp"));
		script.close();
	}	

	// id와 관련된 grade 추출 후 제어
	MemberDAO dao = new MemberDAO();
	String grade = dao.selectMemberGrade(id);
	System.out.println(grade);
	
	if (!(grade.equals("manager"))) {
		script.println(JSFunction.executeAlert("관리자가 아닙니다. 관리자로 로그인 해주신 후 이용해주세요.", "../member/LoginForm.jsp"));
		dao.close();
		script.close();
	}
%>

<div class="mx-auto bg-grey-400">
    <!--Screen-->
    <div class="min-h-screen flex flex-col">
        <div class="flex flex-1">
            <!--Main-->
            <main class="bg-white-300 flex-1 p-3 overflow-hidden">

                <div class="flex flex-col">
                
				
                    <!-- Card Sextion Starts Here -->
                    <div class="flex flex-1 flex-col md:flex-row lg:flex-row mx-2">

                        <!-- card -->

                        <div class="rounded overflow-hidden shadow bg-white mx-2 w-full">
                            <div class="flex">
								<div class="px-8 py-4 border-b border-light-grey w-auto">
									<div class="font-bold text-5xl">Manage System</div>
								</div>
								<div class="px-8 py-4 border-b border-light-grey w-1\/2">

								</div>
								<div class="flex-grow"></div>
								<div class="px-3 py-4 border-b border-light-grey w-auto">
									<div class="font-bold text-xl input-group">
										<input type="text" id="searchIdInput" placeholder="아이디를 입력하세요"/>
									</div>
								</div>
								<div class="sm\:pr-3 py-4 border-b border-light-grey w-auto">
									<div class="font-bold text-sm main-button">
										<input type="button" value="검색" onclick="searchById()"/>
									</div>
								</div>
							</div>
							<form action="" method="post" id="myForm">
                            <div class="table-responsive">
                                <table class="table text-center text-grey-darkest">
                                    <thead class="bg-grey-dark text-white text-normal">
                                    <tr>
                                        <th scope="col" class="table-short">#</th>
                                        <th scope="col" class="table-normal">name</th>
                                        <th scope="col" class="table-normal">id</th>
                                        <th scope="col" class="table-normal">grade</th>
                                        <th scope="col" class="table-normal">nickname</th>
                                        <th scope="col" class="table-long">email</th>
                                        <th scope="col" class="table-long">regidate</th>
                                        <th scope="col" class="table-short">check</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
	                                	// 페이지 번호를 받기
	                                    String pageString = request.getParameter("page");
	                                    int currentPage = Integer.parseInt(pageString);
	                                    System.out.println("현재 페이지 번호: " + currentPage);
	
	                                    // 한 페이지에 보여줄 데이터 설정
	                                    int itemsPerPage = 10;
	
	                                    // 데이터 조회를 위한 시작 인덱스와 종료 인덱스를 계산
	                                    int startIndex = (currentPage - 1) * itemsPerPage;
	                                    int endIndex = startIndex + itemsPerPage - 1;
	                                    
	                                    
	                                    // 데이터베이스의 저장된 데이터 튜플 개수 계산
	                                    int totalItems = dao.selectMemberNum();
	
	                                    // 전체 페이지 개수를 계산
	                                    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
	                                    System.out.println("전체 페이지 개수: " + totalPages);
	
	                                    // 페이지 범위를 초과한 경우, 현재 페이지를 조정
	                                    if (currentPage > totalPages) {
	                                        currentPage = totalPages;
	                                        startIndex = (currentPage - 1) * itemsPerPage;
	                                        endIndex = startIndex + itemsPerPage - 1;
	                                    }
	                                    System.out.println("시작 인덱스: " + startIndex);
	                                    System.out.println("종료 인덱스: " + endIndex);
	                                    
	                                    //=========================================================
                                    
                                    	// 검색창에서 입력된 id를 변수에 저장
                                    	String searchId = request.getParameter("searchId");
                                    	
                                    	// id의 값에 따라 해당하는 id의 데이터 전부 추출 후 ArrayList에 저장
                                        ArrayList<MemberDTO> arr;
                                    	
                                    	// 감색한 게 없으면 데이터베이스에 있는 모든 정보 추출 후 ArrayList에 저장
                                    	if(searchId.equals("NULL"))
                                    		arr = dao.selectMember(startIndex, endIndex + 1);
                                    	else
                                    		arr = dao.selectMember(searchId, startIndex, endIndex + 1);
                                    	 
                                    	dao.close();
                                    	
                                    	//===========================================================
                                        
                                    	// count를 이용해서 startIndex부터 endIndex까지의 데이터의 개수만큼 추출
                                        int count = startIndex;
                                    	for(MemberDTO dto: arr) {
                                    %>
	                                    <tr>
	                                    	<th scope="row"><%=dto.getNum() %></th>
	                                        <td><%=dto.getName() %></td>
	                                        <td><%=dto.getId() %></td>
	                                        <td><%=dto.getGrade() %></td>
	                                        <td><%=dto.getNickname() %></td>
	                                        <td><%=dto.getEmail() %></td>
	                                        <td><%=dto.getRegidate() %></td>
	                                        <td><input type="checkbox" name="checkId" value="<%=dto.getId() %>"/></td>
	                                    </tr>	
                                    <%	
                                    		System.out.println(count);
                                    		if(count == endIndex || count >= totalItems)
                                    			break;
                                    		
                                    		count++;
                                    	}
                                    %>
                                    </tbody>
                                </table>
       						</div>
       						</form>
                        </div>
                    </div>
                </div>
                <!-- 페이징 처리 -->
                <div class="font-bold text-sm main-button">
				    <%-- 이전 페이지 버튼 --%>
				    <a href="./ManageForm.jsp?page=<%=currentPage - 1 %>&searchId=<%=searchId %>"
				       class="px-3 py-1 bg-blue-500 text-white font-semibold rounded-md <%= (currentPage == 1) ? "opacity-50 cursor-not-allowed" : "" %>">
				        이전
				    </a>
				
				    <%-- 페이지 번호 버튼 --%>
				    <% for (int i = 1; i <= totalPages; i++) { %>
				        <a href="./ManageForm.jsp?page=<%=i %>&searchId=<%=searchId %>"
				           class="px-3 py-1 mx-1 bg-blue-500 text-white font-semibold rounded-md <%= (currentPage == i) ? "bg-blue-700" : "" %>">
				            <%=i %>
				        </a>
				    <% } %>
				
				    <%-- 다음 페이지 버튼 --%>
				    <a href="./ManageForm.jsp?page=<%=currentPage + 1 %>&searchId=<%=searchId %>"
				       class="px-3 py-1 bg-blue-500 text-white font-semibold rounded-md <%= (currentPage == totalPages) ? "opacity-50 cursor-not-allowed" : "" %>">
				        다음
				    </a>
				</div>
				<!-- 버튼 처리 -->
	            <div class="flex justify-end">
		            <div class="px-3 py-8 border-b border-light-grey">
						<div class="font-bold text-sm main-button">
							<input type="submit" id="myButton" value="승급" onclick="handleSubmit(event)"/>
						</div>
					</div>
					<div class="px-3 py-8 border-b border-light-grey">
						<div class="font-bold text-sm main-button">
							<input type="submit" id="myButton" value="박탈" onclick="handleSubmit(event)"/>
						</div>
					</div>
					<div class="px-3 py-8 border-b border-light-grey">
						<div class="font-bold text-sm main-button">
							<input type="submit" id="myButton" value="삭제" onclick="handleSubmit(event)"/>
						</div>
					</div>
				</div>
            </main>
        </div>
    </div>
</div>

<script>
//Submit 버튼 클릭 시 실행되는 함수
function handleSubmit(event) {
    event.preventDefault(); // 폼의 기본 동작(페이지 새로고침)을 막기 위해 호출

    // 원하는 조건에 따라 다른 action URL을 설정
    var form = document.getElementById("myForm");
    if (event.target.value == "승급") {
        form.action = "./UpgradeMemberProc.jsp";
    } else if (event.target.value == "박탈") {
        form.action = "./DowngradeMemberProc.jsp";
    } else if (event.target.value == "삭제") {
        form.action = "./DeleteMemberProc.jsp";
    } 

    form.submit(); // 설정된 action URL로 폼을 제출
}

// 입력한 아이디를 url을 통해서 전달
function searchById() {
    var searchId = document.getElementById("searchIdInput").value;
    if (searchId.trim() === "") {
        alert("아이디를 입력해주세요.");
    } else {
    	var encodedSearchId = encodeURIComponent(searchId);
        window.location.href = "./ManageForm.jsp?page=1&searchId=" + encodedSearchId;
    }
}
</script>
</body>

</html>