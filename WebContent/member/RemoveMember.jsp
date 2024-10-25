<%@page import="util.JSFunction"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 입력된 id값을 변수에 저장
	String id = (String)session.getAttribute("id");
	MemberDAO dao = new MemberDAO();
	
	// 관리자 업데이트 확인 제어
	
	int resultCheck = dao.deleteMember(id);
	dao.close();
	
	PrintWriter script = response.getWriter();
	
	// 관리자 승급 성공 시
	if(resultCheck == 1) { 
		System.out.print("계정 삭제 성공!!");
		script.println(JSFunction.executeAlert("회원 탈퇴에 성공하셨습니다.", "./LoginForm.jsp"));
	}
	
	// 관리자 실패 성공 시
	else {
		System.out.print("계정 삭제 실패!!");
		script.println(JSFunction.execulteBackAlert("회원 탈퇴에 실패하셨습니다."));
	}
	
	script.close();
%>