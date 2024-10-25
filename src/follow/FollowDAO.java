package follow;

import java.util.ArrayList;

import util.DatabaseUtil;

public class FollowDAO extends DatabaseUtil {

	public int selectFollowingCount(String id) { // 팔로잉되어있는 멤버 수 반환
		int result = 0;
		String query = "SELECT COUNT(following) FROM follower WHERE myId=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("Exception [selectFollowIdCount]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<FollowDTO> selectFollowAll(String myId) { // 내 아이디를 기점으로 팔로우 테이블 전부 가지고 오기
		ArrayList<FollowDTO> arr = new ArrayList<>();
		String query = "SELECT * FROM follower WHERE myId=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, myId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				FollowDTO dto = new FollowDTO();
				dto.setMyId(rs.getString("myId"));
				dto.setFollowId(rs.getString("followId"));
				dto.setNum(rs.getString("num"));
				dto.setFollowing(rs.getString("following"));
				dto.setFollower(rs.getString("follower"));
				arr.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("Exception [selectFollowId]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return arr;
	}
	

	public int updateFollowing(String myId, String followId, String value) { // 내 아이디에서 해당 계정으로 팔로잉 값을 수정
		int result = 0;
		String query = "UPDATE follower SET following=" + value + " WHERE myId=? and followId=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, myId);
			pstmt.setString(2, followId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception [updateFollowing]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateFollower(String myId, String followId, String value) { // 상대 아이디에서 내 게정으로 팔로잉 값을 수정
		int result = 0;
		String query = "UPDATE follower SET follower=" + value + " WHERE myId=? and followId=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, myId);
			pstmt.setString(2, followId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception [updateFollower]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	public int insertFollowing(String myId, String followId) { // 내 계정 기점으로 상대 계정 포함하여 관련 팔로잉 값 추가
		int result = 0;
		
		String query = "INSERT INTO follower (myId, followId, following) ";
		query += "VALUES (?, ?, 'yes')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, myId);
			pstmt.setString(2, followId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception [insertFollowing]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int insertFollower(String myId, String followId) { // 내 계정 기점으로 상대 계정 포함하여 관련 팔로잉 값 추가
		int result = 0;
		
		String query = "INSERT INTO follower (myId, followId, follower) ";
		query += "VALUES (?, ?, 'yes')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, myId);
			pstmt.setString(2, followId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception [insertFollower]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public int deleteFollower(String myId, String followId) { // 내 계정을 기점으로 상대 계정과 관련된 팔로워 관계 튜플 삭제
		int result = 0;
		String query = "DELETE FROM follower WHERE myId=? and followId=?";
		
		try {
			pstmt = conn.prepareStatement(query);
				
			pstmt.setString(1, myId);
			pstmt.setString(2, followId);
			result = pstmt.executeUpdate();		
		} catch(Exception e){
			System.out.println("Exception [deleteFollower]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	

	
}
