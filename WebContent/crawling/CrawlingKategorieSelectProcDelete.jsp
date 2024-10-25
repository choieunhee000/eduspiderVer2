<%@page import="category.CategoryDAO"%>
<%@page import="category.CategoryDTO"%>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.JSFunction"%>    
<%@ page import="java.io.PrintWriter" %>    

    
<%
        	//id 값 필요함 + 카테고리가 필요함 
                	
                	String kategorie = request.getParameter("Dropkategorie");
                	System.out.println(kategorie);

                	String id = (String)session.getAttribute("id");
                	System.out.println("id:"+id);
                	
                	

                	CategoryDAO kategorieDAO = new CategoryDAO();
                	CategoryDTO dto = new CategoryDTO();
                	
                	
                	int result = kategorieDAO.searchKategorie(kategorie, id);
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
                		int delete = kategorieDAO.deleteKategorie(kategorie,id);
                		PrintWriter script = response.getWriter(); 
                		
                		
                		/* ddao.close();  */
                	}
                	 
                	
                	
                	
                	
                	kategorieDAO.close();
        %>