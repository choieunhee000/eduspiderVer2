<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/input.css" type="text/css">
<link rel="stylesheet" href="css/All.css" type="text/css">
<title>학습도구</title>
</head>
<body>
	<center>
		<h1 class="title">Crawling</h1>
		<br>
		<div class="box1">
			<form action="Crawling.jsp" method="post">
				<p class="text1">Please input INSERT keyword</p>
				<span class="keyword_text">keyword</span><span class="number_text">number</span>
				<br> <input type="text" name="keyworD" class="keyword"><input
					type="text" name="num" class="number"><br> <input type="submit"
					value="INSERT" class="button">
			</form>
		</div>
		<div class="box2">
			<form action="List.jsp" method="post">
				<p class="text2">Please input LIST keyword</p>
				<span class="keyword_text2">keyword</span><br>
				<input type="text" name="keyworD" class="keyword2"><br><input
					type="submit" value="LIST" class="button">
			</form>
			<form action="tableAll.jsp" method="post">
				<input type="submit" value="ALL_LIST" class="button">
			</form>
		</div>
	</center>
</body>
</html>

