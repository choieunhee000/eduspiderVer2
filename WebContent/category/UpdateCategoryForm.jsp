<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String category = request.getParameter("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 추가</title>
    <link rel="stylesheet" href="../css/popup.css">
</head>
<body>
    <form action="../category/UpdateCategoryProc.jsp" method ="get">
    <div class="content">
        <div class="main">
          <input type="hidden" value="<%=category %>" name="category"/>         
            <input type="text" placeholder="<%=category %>" name="renameCategory"/>
            <div class="main-button">
                <input type="submit" value="저장"/>
                <button onclick="self.close()">취소</button>
            </div>            
        </div>
    </div>
    </form>
</body>
</html>