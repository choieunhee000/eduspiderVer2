<%@page import="util.JSFunction"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// �Էµ� ������ ������ ����
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");
	
	member.MemberDAO dao = new member.MemberDAO();
	MemberDTO dto = new MemberDTO();
	
	// dto ��ü�� �� �������� ����
	dto.setName(name);
	dto.setId(id);
	dto.setPassword(password);
	dto.setGrade("user");
	dto.setNickname(nickname);
	dto.setEmail(email);
	dto.setProfileimg("http://localhost:8080/Hellow_World/profileImg/spider-1.PNG");
	// dto ��ü ����� dao�� �̿��Ͽ� �����ͺ��̽��� �����Ͽ� DB ����
	int result = dao.insertMember(dto);
	
	PrintWriter script = response.getWriter();
	
	// DB ���� ���� ��
	if(result == 1){ 
		
		System.out.print("ȸ������ ����!!");
		
		// "�����ڷ� �ø��� �����߽��ϴ�" ������ alert()�Լ��� ��� �� �ش� url�� �̵�
		script.println(JSFunction.executeAlert("ȸ������ �����߽��ϴ�.", "./LoginForm.jsp"));
		script.close();
	}
	else{
		script.println(JSFunction.execulteBackAlert("���̵� �ߺ��Ǿ����ϴ�."));
		script.close();
	}
%>