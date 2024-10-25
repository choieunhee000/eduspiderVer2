<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="board_ver3.TemporaryBoardDAO"%>
<%@page import="board_ver3.BoardDTO"%>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.List"%> 
<%@page import="util.JSFunction"%>

<%
	String Num[] = request.getParameterValues("num");
	String category = request.getParameter("category");
	String userId = (String)session.getAttribute("id");
	
	//sesstionid로 받아와야함 
/* 	
	for(int i=0; i < Num.length; i++){
		System.out.println(Num[i]);
	} */ 
	
	
	TemporaryBoardDAO dao = new TemporaryBoardDAO(); 
	BoardDTO dto = new BoardDTO(); 
	
	List<BoardDTO> boardList = dao.selectBoardDAO(Num,userId);
	dao.insertBoardDAO(boardList,userId);
	
	int result = dao.insertBoardDAO(boardList, userId, category);
	

 	PrintWriter script = response.getWriter();   
 	 
 	if (result == 1){ 
 		script.print(JSFunction.executeAlert("저장 성공", "../main/MainForm.jsp?page=1"));
 		script.close();
 	}
 	else {
 		script.print(JSFunction.execulteBackAlert("저장 실패"));
 		script.close();
 	}
	  
	
%>

