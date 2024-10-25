<%@page import="member.MemberDAO"%>
<%@page import="util.JSFunction"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8"); 

    // 입력한 아이디와 패스워드를 변수에 저장
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    PrintWriter script = response.getWriter();
    
    // 아이디 또는 비밀번호가 입력되지 않았을 때 제어
    if(id.equals("") || password.equals(""))
        script.println(JSFunction.execulteBackAlert("아이디 또는 바꿀 비밀번호를 입력하지 않았습니다. 제대로 입력해주세요."));
    
    // dto 객체 값들로 dao를 이용하여 데이터베이스에 접근하여 해당 값과 관련된 pwd 수정
    MemberDAO dao = new MemberDAO();
    int result = dao.updateMemberResetPassword(id, password);
    dao.close();
    
    // 패스워드 수정 성공
    if(result == 1) {
        script.println(JSFunction.executeAlert("패스워드가 알맞게 변경되었습니다. 로그인 페이지로 이동합니다.", "./LoginForm.jsp"));
    }
    
    // 페스워드 수정 실패
    else {
        script.println(JSFunction.execulteBackAlert("아이디를 알맞게 입력하지 않았습니다. 제대로 입력해주세요."));
    }

%>