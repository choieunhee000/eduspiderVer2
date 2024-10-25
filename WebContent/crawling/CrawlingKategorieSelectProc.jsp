<%@page import="category.CategoryDAO"%>
<%@page import="category.CategoryDTO"%>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.JSFunction"%>    
<%@ page import="java.io.PrintWriter" %>    

    
<%
        	//id 값 필요함 + 카테고리가 필요함 
                        	
                        	String kategorie = request.getParameter("kategorie");
                        	System.out.println(kategorie);

                        	String id = (String)session.getAttribute("id");
                        	System.out.println("id:"+id);
                        	
                        	

                        	CategoryDAO kategorieDAO = new CategoryDAO();
                        	CategoryDTO dto = new CategoryDTO();
                        	
                        	
                        	int result = kategorieDAO.searchKategorie(kategorie, id);
                        	if(result == 1){
                        		
                        		System.out.println("카테고리존재");
                        		PrintWriter script = response.getWriter(); 
                        		
                        		
                        	}
                        	else if(result == 0){
                        		CategoryDAO rdao = new CategoryDAO();
                        		CategoryDTO rdto = new CategoryDTO();
                        		
                        		rdto.setKategorie(kategorie);
                        		rdto.setId(id);
                        		
                        		int insert = rdao.insertCategory(rdto);
                        		PrintWriter script = response.getWriter(); 
                        		
                        		
                        		rdao.close();
                        	}
                        	
                        	
                        	
                        	
                        	
                        	kategorieDAO.close();
        %>