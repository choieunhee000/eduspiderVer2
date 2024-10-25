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

//내 계정을 기준으로 follower 테이블 전부 추출
FollowDAO fDao = new FollowDAO();
MemberDAO mDao = new MemberDAO();
ArrayList<FollowDTO> followList = fDao.selectFollowAll(myId);
ArrayList<MemberDTO> memberList = mDao.selectMember();

// follower 테이블에 존재할 시 "이미 팔로잉한 계정입니다."라고 제어
int flag = 0;
for(MemberDTO dto: memberList) {
	if (dto.getId().equals(followId)) {
		flag++;
		break;
	}
}

if (flag == 0) {
	PrintWriter script = response.getWriter();
	script.println(JSFunction.executeAlert("존재하지 않는 계정입니다.", "../profile/Profile.jsp"));
	script.close();
}

// 내 계정을 기준으로 follower 테이블 전부 추출

int result = 0;
flag = 0;


for(FollowDTO dto: followList) {
	// 내가 이미 해당 계정과 팔로워가 되어 있는 경우: "이미 팔로워한 계정입니다." 문구 출력 후 프로필 페이지로 강제 이동
	if (dto.getFollowId().equals(followId) && dto.getFollowing() != null) {
		PrintWriter script = response.getWriter();
		flag = 1;
		script.println(JSFunction.executeAlert("이미 팔로워한 계정입니다.", "../profile/Profile.jsp"));
		script.close();
		break;
	}
	// 해당 계정 입장에서 상대 계정을 following 값을 "yes"로, 상대 계정 입장에서 해당 계정을 follower 값을 "yes"로 변환
	else if (dto.getFollowId().equals(followId) && dto.getFollowing() == null) {
		
		flag = 1;
		result = fDao.updateFollowing(myId, followId, "\'yes\'");
		
		if (result == 1)
			result = fDao.updateFollower(followId, myId, "\'yes\'");
		
		break; 
	}
}

// 위의 반복문을 거치지 않았을 때 (즉, follow 테이블에 팔로잉하고싶은 계정이 존재하지 않을 때) 계정 추가 & 팔로잉 성공에 해당하는 "yes"값 적용
if (flag == 0) {
	result = fDao.insertFollowing(myId, followId);
	
	if(result == 1)
		result = fDao.insertFollower(followId, myId);
}

fDao.close();

// 팔로잉 성공 시 "팔로워 성공하였씁니다" 문구 출력 후 프로필 페이지로 강제 이동
if (result == 1){
	PrintWriter script = response.getWriter();
	script.println(JSFunction.executeAlert("팔로잉 성공하였습니다.", "../profile/Profile.jsp"));
	script.close();
}
// 팔로잉 실패 시 "팔로워 실패하였습니다" 문구 출력 후 프로필 페이지로 강제 이동
else {
	PrintWriter script = response.getWriter();
	script.println(JSFunction.executeAlert("팔로잉 실패하였습니다.", "../profile/Profile.jsp"));
	script.close();
}





%>