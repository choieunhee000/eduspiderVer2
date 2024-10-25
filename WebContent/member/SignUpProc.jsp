<%@page import="util.JSFunction"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 입력된 값들을 변수에 저장
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");
	
	member.MemberDAO dao = new member.MemberDAO();
	MemberDTO dto = new MemberDTO();
	
	// dto 객체에 각 변수값들 저장
	dto.setName(name);
	dto.setId(id);
	dto.setPassword(password);
	dto.setGrade("user");
	dto.setNickname(nickname);
	dto.setEmail(email);
	dto.setProfileimg("http://localhost:8080/Hellow_World/profileImg/spider-1.PNG");
	// dto 객체 값들로 dao를 이용하여 데이터베이스에 접근하여 DB 저장
	int result = dao.insertMember(dto);
	
	PrintWriter script = response.getWriter();
	
	// DB 저장 성공 시
	if(result == 1){ 
		
		System.out.print("회원가입 성공!!");
		
		// "관리자로 올리기 성공했습니다" 문구를 alert()함수로 출력 후 해당 url로 이동
		script.println(JSFunction.executeAlert("회원가입 성공했습니다.", "./LoginForm.jsp"));
		script.close();
	}
	else{
		script.println(JSFunction.execulteBackAlert("아이디가 중복되었습니다."));
		script.close();
	}
%>