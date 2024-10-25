<%@page import="java.io.PrintWriter"%>
<%@page import="util.JSFunction"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	PrintWriter script = response.getWriter();
	
	if(name.equals("") || email.equals(""))
		script.println(JSFunction.execulteBackAlert("값을 전부 다 입력하지 않았습니다."));
	
	member.MemberDAO dao = new member.MemberDAO();
	MemberDTO dto = new MemberDTO();
	
	dto.setName(name);
	dto.setEmail(email);
	
	String id = dao.selectMemberFindId(dto);
	dto.setId(id);
	System.out.println("아이디: " + dto.getId());
	String showId = "";
	String msg = "";
	
	if(dto.getId().equals("")) {
		msg = "값을 잘못 입력하셨습니다.";
	}
	else {
		for(int i = 0; i < dto.getId().length(); i++){
	if(i % 2 == 1)
		showId += '*';
	else
		showId += id.charAt(i);
		}
		
		msg = "당신의 아이디는 " + showId + "입니다.";
	}
	
	script.println(JSFunction.executeAlert(msg, "./LoginForm.jsp"));
%>