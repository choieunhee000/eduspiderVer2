<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<link rel="stylesheet" href="../css2/popup_profile.css">
<style>
    .main-img {
        position: relative;
    }
    
    .main-img img {
        cursor: pointer;
    }
    
    .main-img .selected {
        border: 2px solid red;
    }
</style>
<script>
function selectImage(image) {
    // 이미지 선택 시 다른 이미지의 선택 상태를 초기화
    var images = document.querySelectorAll(".main-img img");
    for (var i = 0; i < images.length; i++) {
        images[i].classList.remove("selected");
    }
    
    // 선택한 이미지의 클래스에 "selected" 추가
    image.classList.add("selected");
    
 	// 선택한 이미지의 값(hidden input) 설정
    var selectedImage = document.getElementById("selectedImage");
    selectedImage.value = image.src;
}
</script>
    
</head>
<body>
    <form action="../profile/profileUpdateProc.jsp" method="get">
    <div class="content">
        <div class="main">
            
            <h1>프로필 사진 선택</h1>
              <div class="main-img">
                <img src="../profileImg/spider-1.PNG" alt="" onclick="selectImage(this)" />
                <img src="../profileImg/spider-2.PNG" alt="" onclick="selectImage(this)" />
                <img src="../profileImg/spider-3.PNG" alt="" onclick="selectImage(this)" />
                <img src="../profileImg/spider-4.PNG" alt="" onclick="selectImage(this)" />
                <img src="../profileImg/spider-5.PNG" alt="" onclick="selectImage(this)" />
                <img src="../profileImg/spider-6.PNG" alt="" onclick="selectImage(this)" />
                <img src="../profileImg/spider-7.PNG" alt="" onclick="selectImage(this)" />
                <img src="../profileImg/spider-8.PNG" alt="" onclick="selectImage(this)" />
                <input type="hidden" id="selectedImage" name="selectedImage" value="">
            </div>
            
            <h1>한줄소개</h1>
            <div class="introduce">
                <input type="text" id="introduce" placeholder="안녕 나는 ICT융합보안과" name="comment">
            </div>
            
            <h1>비밀번호 확인</h1>
            <div class="pass">
                <input type="password" placeholder="비밀번호 재입력" name="password"/>
            </div>
            <div class="main-button">
                <input type="submit" value="저장"/>
                <button onclick="self.close()">취소</button>
            </div>            
        </div>
    </div>
    </form>
</body>
</html>