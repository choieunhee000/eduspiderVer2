<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 추가</title>
    <link rel="stylesheet" href="../css/popup.css">
</head>
<body>
    <form action="../category/InsertCategoryProc.jsp" method ="get">
    <div class="content">
        <div class="main">
            <input type="text" placeholder="카테고리명" name="category"/>
            <div class="main-button">
                <input type="submit" value="저장"/>
                <button onclick="self.close()">취소</button>
            </div>            
        </div>
    </div>
    </form>
</body>
</html>