<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "common.JDBConnect" %>

<%@ page import = "java.io.File" %>
<%@ page import = "java.util.Scanner" %>

<%@ page import = "org.jsoup.Jsoup" %>
<%@ page import = "org.jsoup.nodes.Document" %>
<%@ page import = "org.jsoup.nodes.Element" %>
<%@ page import = "org.jsoup.select.Elements" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Insert title here</title>
</head>
<body>
	<h2>크롤링</h2>
	<%
	//DB에 연결 
	JDBConnect jdbc = new JDBConnect();
	
	String url = "https://search.daum.net/search?w=blog&f=section&SA=tistory&lpp=10&nil_profile=vsearch&nil_src=tistory&q=라우터";
	        
	try {
		Document financePage = Jsoup.connect(url).get();
		
	    System.out.println(financePage.select(".box_type_m + iframe").attr("src"));
	
	    Document iFrameUrl = Jsoup.connect(url).get();// + financePage.select("div.wrap-movie-chart")).get(); //가져올 애들 전
	             
	   	String _site_type;
	    String _title;
	    String _content;
	    String _regdate;
	    String _link;
	    
	    //Elements site_type = iFrameUrl.select("div.menu_opt span.label"); //사이트 이름
	    Elements title = iFrameUrl.select("div.cont_inner a.f_link_b"); //제목
	    Elements content = iFrameUrl.select("div.cont_inner p"); //약간보이는 내용
	    Elements regdate = iFrameUrl.select("div.cont_inner span.date"); //작성일
	    Elements link = iFrameUrl.select("div.cont_inner span.f_l a.f_url");
	             
	    int inResult = 0;
	    
	    //쿼리문 생성 
	    String sql = "INSERT INTO route VALUES(?,?,?,?,?)";
	    PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	  
    	_site_type = "tistory";
  
	    for (int i=0; i<title.size() ;i++)
	    {
	    	_title = title.get(i).text();
	    	_content = content.get(i).text();
	    	_regdate = regdate.get(i).text();
	    	_link = link.get(i).text();
	    	
	    	out.println(_title+"************");
	    	out.println(_content+"************");
	    	out.println(_regdate+"************");
	    	out.println(_link+"************");
	    	
	    	psmt.setString(1, _site_type);
	    	psmt.setString(2, _title);
	    	psmt.setString(3, _content);
	    	psmt.setString(4, _regdate);
	    	psmt.setString(5, _link);
	    	psmt.executeUpdate();
	    	out.println(inResult + "행이 입력되었습니다.");
	    	//inResult++;
	    }
	    
		//out.println(inResult + "행이 입력되었습니다.");
	    
	    System.out.println("-----------------------------");
	    
	    //System.out.println(siteName.text());
	    System.out.println(title.text());
	    System.out.println(content.text());
	    System.out.println(regdate.text());
	    System.out.println(link.text());
	    for(Element e : link)
	    { 
	    	System.out.println(e.getElementsByAttribute("href").attr("href"));
	    }
	    
	    } catch (Exception e) 
		{
	    	e.printStackTrace();
	    }
		//연결 닫기 
		jdbc.close();
	%>
</body>
</html>