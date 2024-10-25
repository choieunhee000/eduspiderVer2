<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="util.JSFunction"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="follow.FollowDAO"%>
<%@page import="follow.FollowDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 내가 접속한 계정과 상대 계정을 변수에 저장
String myId = (String)session.getAttribute("id");
String followId = request.getParameter("followId");
System.out.println(followId);

// 내 계정을 기준으로 follower 테이블 전부 추출
FollowDAO fDao = new FollowDAO();
ArrayList<FollowDTO> followList = fDao.selectFollowAll(myId);

int result = 0;


for(FollowDTO dto: followList) {
	// 나와 상대 계정의 관계에서 following이 yes일 경우
	if (dto.getFollowId().equals(followId) && dto.getFollowing() != null){
		
		// 상대가 나를 팔로우하지 않았을 경우
		if(dto.getFollower() == null) {
			result = fDao.deleteFollower(myId, followId);
			
			if(result == 1)
				result = fDao.deleteFollower(followId, myId);
		}
		
		// 상대가 나를 팔로우했을 경우
		else {
			result = fDao.updateFollowing(myId, followId, "NULL");
			
			if (result == 1)
				result = fDao.updateFollower(followId, myId, "NULL");	
		}
		
		break;
	}
}

fDao.close();

if (result == 1){
	PrintWriter script = response.getWriter();
	script.println(JSFunction.executeAlert("언팔로잉 성공하였습니다.", "../profile/Profile.jsp"));
	script.close();
}
else {
	PrintWriter script = response.getWriter();
	script.println(JSFunction.executeAlert("언팔로잉 실패하였습니다.", "../profile/Profile.jsp"));
}
%>