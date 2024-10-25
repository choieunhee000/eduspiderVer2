<%@page import="util.JSFunction"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 입력된 id값을 변수에 저장
	String id[] = request.getParameterValues("checkId");
	MemberDAO dao = new MemberDAO();
	
	// dao 객체를 이용해 각 id에 해당하는 grade 값 "manager"로 수정
	int[] result = new int[id.length];
	
	for(int i = 0; i < id.length; i++){
		result[i] = dao.deleteMember(id[i]);
	}
	
	PrintWriter script = response.getWriter();
	dao.close();
	
	// 관리자 업데이트 확인 제어
	
	int resultCheck = 1;
	
	for(int i = 0; i < result.length; i++){
		if(result[i] == 0){
			resultCheck = 0;
			break;
		}
	}
	
	// 관리자 승급 성공 시
	if(resultCheck == 1) { 
		System.out.print("계정 삭제 성공!!");
		script.println(JSFunction.executeAlert("계정 삭제에 성공하셨습니다.", "./ManageForm.jsp?page=1&searchId=NULL"));
	}
	
	// 관리자 실패 성공 시
	else {
		System.out.print("계정 삭제 실패!!");
		script.println(JSFunction.executeAlert("계정 삭제에 실패하셨습니다.", "./ManageForm.jsp?page=1&searchId=NULL"));
	}
	
	script.close();

%>
   