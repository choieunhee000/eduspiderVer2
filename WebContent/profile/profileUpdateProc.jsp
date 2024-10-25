<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="util.JSFunction"%>
<%@page import="member.MemberDTO"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트사용하게함  -->

    

<%
	
	String selectedImage = request.getParameter("selectedImage");
   String password = request.getParameter("password");
   String comment = request.getParameter("comment");

	
	//세션값 ID 가져오기
	String id = (String)session.getAttribute("id");
	
	// 로그인 값을 데이터베이스 값을 불러와 체크
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.selectMember(id);
		 

		
		// 비밀번호 불일치 시 제어
		if(!(dto.getPassword().equals(password))) {
			PrintWriter script = response.getWriter();
			script.println(JSFunction.execulteBackAlert("입력하신 비밀번호가 일치하지 않습니다"));
			script.close();
		} 
		else{
			if(comment.equals(""))
				comment = dto.getComment();
			if(selectedImage.equals(""))
				selectedImage = dto.getProfileimg();
			
			dao.updateProfile(id, comment, selectedImage);
		}
		
		 
		 
		
	
		
		
		

%>


<script>
// 팝업 창 닫기 
/* function closeWindow() {
    window.close();
 } */
 	alert("프로필 수정 되었습니다.");
	window.close();
	window.opener.location.reload();
</script>