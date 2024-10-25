<%@page import="util.JSFunction"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트사용하게함  -->
<%@page import="board_ver3.TemporaryBoardDAO"%>
<%@page import="board_ver3.BoardDTO"%>

<%
	request.setCharacterEncoding("UTF-8"); 

	// 아이디와 패스워드 입력 값 변수 저장
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// 로그인 값을 데이터베이스 값을 불러와 체크
	member.MemberDAO dao = new member.MemberDAO();
	MemberDTO dto = dao.selectMemberLogin(id,password);
	 

	
	//Login 성공: 세션 설정
		if(dto != null) {
			session.setAttribute("id", dto.getId());
			
			if (dto.getGrade().equals("user")) // 사용자일 때의 url 진입
				response.sendRedirect("../main/MainForm.jsp?page=1");
			
			if (dto.getGrade().equals("manager")) // 관리자일 때의 url 진입
				response.sendRedirect("../manage/ManageForm.jsp?page=1&searchId=NULL");
		} 
		
		// Login 실패: 이전 페이지로 되돌아감
		else {
			PrintWriter script = response.getWriter();
			script.println(JSFunction.executeAlert("아이디와 비밀번호가 일치하지 않습니다", "./LoginForm.jsp"));
			script.close();
		}
	
%>  
<%
	TemporaryBoardDAO check = new TemporaryBoardDAO();
    check.dropTemporaryDAO(id);
%>
