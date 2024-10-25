<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="category.CategoryDAO"%>
<%@page import="category.CategoryDTO"%>
    
<%@page import="util.JSFunction"%>    
<%@ page import="java.io.PrintWriter" %>    

    
<%
        	//id 값 필요함 + 카테고리가 필요함 
                	
                	String category = request.getParameter("category");
                	System.out.println(category);

                	String id = (String)session.getAttribute("id");
                	System.out.println("id:"+id);
                	
                	

                	CategoryDAO categoryDAO = new CategoryDAO();
                	CategoryDTO dto = new CategoryDTO();
                	
                	
                	int result = categoryDAO.searchCategory(category, id);
                	System.out.println("결과값: "+result);
                	if(result == 0){
                		
                		System.out.println("카테고리존재하지 않음");
                		PrintWriter script = response.getWriter(); 
                		
                		
                	}
                	else if(result == 1){
                		/* KategorieDAO ddao = new KategorieDAO();
                		KategorieDTO ddto = new KategorieDTO();
                		
                		ddto.setKategorie(kategorie);
                		ddto.setId(id);
                		
                		int insert = ddao.deleteKategorie(ddto); */
                		int delete = categoryDAO.deleteCategory(category,id);
                		PrintWriter script = response.getWriter(); 
                		System.out.println("카테고리 삭제 완");
                		
                		script.println(JSFunction.executeAlert("카테고리가 성공적으로 삭제되었습니다.", "../main/MainForm.jsp?page=1"));
                		
                		
                		/* ddao.close();  */
                	}
                	 
                	
                	
                	
                	
                	
                	categoryDAO.close();
        %>