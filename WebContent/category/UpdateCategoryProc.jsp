<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="category.CategoryDAO"%>
<%@page import="category.CategoryDTO"%>
<%@page import="util.JSFunction"%>    
<%@ page import="java.io.PrintWriter" %>    

<%

	// 입력받은 카테고리를 변수에 저장
	String renameCategory = request.getParameter("renameCategory");

	String category = request.getParameter("category");
	System.out.println("카테고리 이름 변경"+renameCategory);
	System.out.println("category"+category);
	
	//세션값 ID 가져오기
	String id = (String)session.getAttribute("id");
	System.out.println("id:"+id);
	
	// 위에서 가져온 값듣을 category db에 저장
	CategoryDAO categoryDAO = new CategoryDAO();
	CategoryDTO dto = new CategoryDTO();
	
	
	
	int result = categoryDAO.searchCategory(renameCategory, id);
	System.out.println("result"+result);

	
	System.out.println("result:"+result);
	if(result == 1){
		System.out.println("카테고리존재");

		PrintWriter script = response.getWriter();
		script.println(JSFunction.execulteBackAlert("이미 존재하는 카테고리입니다."));
		script.close();
		

		
	}
	else if(result == 0){
	
		int insert = categoryDAO.updatCategory(id, category, renameCategory);

		
		categoryDAO.close();
	}

	categoryDAO.close();
	
	

%>



<script>
// 팝업 창 닫기 
/* function closeWindow() {
    window.close();
 } */
 
 alert("성공적으로 카테고리 수정 완료하였습니다.");
	window.close();
	window.opener.location.reload();
</script>