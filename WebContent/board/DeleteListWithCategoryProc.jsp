<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="board_ver3.BoardDAO"%>
<%@page import="board_ver3.BoardDTO"%>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.List"%> 
<%@page import="util.JSFunction"%>

   
<%
	String num[] = request.getParameterValues("num");
	String category = request.getParameter("category");
	System.out.println("딜리트시도 2차 "+category);
	BoardDAO dao = new BoardDAO();
	int result = dao.deleteBoardDAO(num);
	for(int i = 0;i<num.length;i++){
		System.out.println( "딜리트시도"+num[i]);
	}
	
	PrintWriter script = response.getWriter();  
	
	if (result==1){
		script.print(JSFunction.executeAlert("삭제 성공", "../board/ListWithCategory.jsp?page=1&category="+category));
 		script.close();
	}
	else {
 		script.print(JSFunction.execulteBackAlert("삭제 실패"));
 		script.close();
 	}
	
%>