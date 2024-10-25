<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="common.JDBConnect"%>
<%@ page import="board.BoardCreate"%>

<%@ page import="java.io.File"%>

<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page import="org.jsoup.select.Elements"%>

<%@ page import="javax.servlet.ServletContext"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>학습도구</title>
<link rel="stylesheet" href="css/Crawling.css" type="text/css">
<link rel="stylesheet" href="css/All.css" type="text/css">
</head>
<body>
	<center>
	<h2 class="title">Crawling</h2>
	<%
	//DB에 연결 
	JDBConnect jdbc = new JDBConnect();

	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	int _num = Integer.parseInt(num);

	String keyword = request.getParameter("keyworD");

	//Create 객체를 생성해 DB에 연결 
	BoardCreate create = new BoardCreate(application);

	create.findTable(keyword);// table 확인 
	create.close(); // DB 연결 닫기 

	int page_num = 1;

	String _url;
	String url[] = { "", "" };
	url[0] = "https://search.daum.net/search?w=blog&f=section&SA=tistory&lpp=10&nil_profile=vsearch&nil_src=tistory&q="
			+ keyword + "&DA=PGD&p=" + page_num;
	url[1] = "https://search.naver.com/search.naver?where=view&sm=tab_jum&query=" + keyword;

	String title_save[] = { "div.cont_inner a.f_link_b", "a.api_txt_lines" };
	String content_save[] = { "div.cont_inner p", "div.total_group" };
	String regdate_save[] = { "div.cont_inner span.date", "span.etc_dsc_area span.sub_time" };
	String link_save[] = { "div.cont_inner span.f_l a.f_url",
			"div[class=total_area] a[class=api_txt_lines total_tit _cross_trigger]" };

	String _site_type[] = { "tistory", "naver" };
	String _title;
	String _content;
	String _regdate;
	String _link;

	%>
	<p class="enter">entered</p>
	<% 
	for (int j = 0; j < 2; j++) {
		int inResult = 0;
		for (page_num = 1; page_num <= _num; page_num++) {

			_url = url[j];

			try {
		Document financePage = Jsoup.connect(url[j]).get();
		Document iFrameUrl = Jsoup.connect(url[j]).get();

		Elements title = iFrameUrl.select(title_save[j]); //제목
		Elements content = iFrameUrl.select(content_save[j]); //약간보이는 내용
		Elements regdate = iFrameUrl.select(regdate_save[j]); //작성일
		Elements link = iFrameUrl.select(link_save[j]);
		
		//쿼리문 생성 
		String sql = "INSERT INTO " + keyword + " VALUES(seq_board_num.nextval,?,?,?,?,?)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);

		for (int i = 0; i < title.size(); i++) {
			_title = title.get(i).text();
			_content = content.get(i).text();
			_regdate = regdate.get(i).text();
			_link = link.get(i).text();
			if (_site_type[j].equals("naver")) {
				_link = link.attr("href");
			}

			psmt.setString(1, _site_type[j]);
			psmt.setString(2, _title);
			psmt.setString(3, _content);
			psmt.setString(4, _regdate);
			psmt.setString(5, _link);
			psmt.executeUpdate();
			inResult++;
		}

			} catch (Exception e) {
		e.printStackTrace();
		System.out.println("크롤링중 예외 발생 ");
			}

		}
		%>
		<span><%= _site_type[j] %></span>
		<span> : <%= inResult %></span><br>
		<%
	}
	
	//연결 닫기 
	jdbc.close();
	%>
	<form action="Input_keyword.jsp" method="post">
				<input type="submit" value="HOME" class="button">
	</form>
	</center>
</body>
</html>