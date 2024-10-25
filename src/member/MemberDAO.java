package member;

import java.util.ArrayList;

import util.DatabaseUtil;

public class MemberDAO extends DatabaseUtil {
	
	public int insertMember(MemberDTO dto) { // member 테이블에 회원 정보 저장
		int result = 0;
		
		String query = "INSERT INTO member (name, id, password, grade, nickname, email, regidate, profileimg) ";
		query += "VALUES (?, ?, ?, ?, ?, ?, NOW(),?)";
			
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId()); 
			pstmt.setString(3, dto.getPassword()); 
			pstmt.setString(4, dto.getGrade()); 
			pstmt.setString(5, dto.getNickname()); 
			pstmt.setString(6, dto.getEmail()); 
			pstmt.setString(7, dto.getProfileimg());
			
			result = pstmt.executeUpdate();		
		} catch(Exception e){
			System.out.println("Exception [insertMember]: " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public MemberDTO selectMemberLogin(String id, String password) { // member 테이블에 id와 password와 관련된 데이터 추출
        MemberDTO dto = null;
        String query = "SELECT * FROM member WHERE id=? AND password=?";
        
        try { 
        	pstmt = conn.prepareStatement(query);
        	
        	pstmt.setString(1, id);
        	pstmt.setNString(2, password);
        	
        	rs = pstmt.executeQuery();
        	if(rs.next()) {
        		dto = new MemberDTO();
        		dto.setNum(rs.getString(1));
        		dto.setName(rs.getString(2)); 
        		dto.setId(rs.getString(3));
        		dto.setPassword(rs.getString(4));
        		dto.setGrade(rs.getString(5));
        		dto.setNickname(rs.getString(6));
        		dto.setEmail(rs.getString(7));
        		dto.setRegidate(rs.getString(8));
        	}
        } catch(Exception e) {
        	System.out.println("Exception [selectMemberLogin]: " + e.getMessage());
        	e.printStackTrace();
        }
        return dto;	
	}
	 
	public String selectMemberFindId(MemberDTO dto) { // member 테이블에 name, email과 관련된 id 추출
		String result = "";
		String query = "SELECT id FROM member WHERE name=? and email=?";
        
		try { 
        	pstmt = conn.prepareStatement(query);
             
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getEmail());

            rs = pstmt.executeQuery();
            
            if (rs.next())
            	result = rs.getString("id");
        } catch(Exception e) {
        	System.out.println("Exception [selectMemberFindId]: " + e.getMessage());
            e.printStackTrace();
        }
		 
		return result;
	}
	
	public String selectMemberGrade(String id) { // member 테이블에 id와 관련된 grade 추출
		String result = "";
		String query = "SELECT grade FROM member WHERE id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
		
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getString("grade");
		} catch(Exception e) {
			System.out.println("Exception [selectMemberGrade]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	public MemberDTO selectMember(String id) { // member 테이블에 해당 id와 관련된 유저 정보를 담아 추출
        MemberDTO dto = new MemberDTO();
        String query = "SELECT * FROM member WHERE id = ?";
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                dto.setNum(rs.getString("num"));
                dto.setName(rs.getString("name"));
                dto.setId(rs.getString("id"));
                dto.setPassword(rs.getString("password"));
                dto.setGrade(rs.getString("grade"));
                dto.setNickname(rs.getString("nickname"));
                dto.setEmail(rs.getString("email"));
                dto.setRegidate(rs.getString("regidate"));
                dto.setComment(rs.getString("comment"));
                dto.setProfileimg(rs.getString("profileimg"));
            }
        } catch (Exception e) {
            System.out.println("Exception [selectMember]: " + e.getMessage());
            e.printStackTrace();
        }
        
        return dto;
        
    }
	
	
	
	
	
	public ArrayList<MemberDTO> selectMember() { // member 테이블에 모든 계정을 ArrayList 안에 담아 추출
		ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
		String query = "SELECT * FROM member";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setGrade(rs.getString("grade"));
				dto.setNickname(rs.getString("nickname"));
				dto.setEmail(rs.getString("email"));
				dto.setRegidate(rs.getString("regidate"));
				
				arr.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("Exception [selectMember]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return arr;
	}
	
	
	
	
	public ArrayList<MemberDTO> selectMember(int startIndex, int endIndex) { // member 테이블에 내가 원하는 인덱스의 위치만큼 ArrayList 안에 담아 추출
        ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
        String query = "SELECT * FROM member LIMIT ?, ?";
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, startIndex);
            pstmt.setInt(2, endIndex);
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                MemberDTO dto = new MemberDTO();
                dto.setNum(rs.getString("num"));
                dto.setName(rs.getString("name"));
                dto.setId(rs.getString("id"));
                dto.setPassword(rs.getString("password"));
                dto.setGrade(rs.getString("grade"));
                dto.setNickname(rs.getString("nickname"));
                dto.setEmail(rs.getString("email"));
                dto.setRegidate(rs.getString("regidate"));
                
                arr.add(dto);
            }
            
        } catch (Exception e) {
            System.out.println("Exception [selectMember]: " + e.getMessage());
            e.printStackTrace();
        }
        
        return arr;
    }
	
	
	 public ArrayList<MemberDTO> selectMember(String searchId, int startIndex, int endIndex) { // member 테이블에 검색한 id에 해당하는 계정을 ArrayList 안에 담아 추출
	        ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
	        String query = "SELECT * FROM member WHERE id = ? LIMIT ?, ?";
	        
	        try {
	            pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, searchId);
	            pstmt.setInt(2, startIndex);
	            pstmt.setInt(3, endIndex);
	            
	            rs = pstmt.executeQuery();
	            
	            while(rs.next()) {
	                MemberDTO dto = new MemberDTO();
	                dto.setNum(rs.getString("num"));
	                dto.setName(rs.getString("name"));
	                dto.setId(rs.getString("id"));
	                dto.setPassword(rs.getString("password"));
	                dto.setGrade(rs.getString("grade"));
	                dto.setNickname(rs.getString("nickname"));
	                dto.setEmail(rs.getString("email"));
	                dto.setRegidate(rs.getString("regidate"));
	                
	                arr.add(dto);
	            }
	            
	        } catch (Exception e) {
	            System.out.println("Exception [selectMember]: " + e.getMessage());
	            e.printStackTrace();
	        }
	        
	        return arr;
	    }
	
	
	
	public int selectMemberNum() {
		int result = 0;
		String query = "SELECT COUNT(id) FROM member";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("Exception [selectMemberNum]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	 
	public int deleteMember(String id) { // member 테이블에 id와 관련된 데이터 삭제
		int result = 0;
		String query = "DELETE FROM member WHERE id=?";
			
		try {
			pstmt = conn.prepareStatement(query);
				
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();		
		} catch(Exception e){
			System.out.println("Exception [deleteMember]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	 
	public int updateMember(String id, String grade) { // member 테이블에 id와 관련된 grade 데이터 수정
		int result = 0;
		String query = "UPDATE member SET grade=? WHERE id=?";
		 
		try {
			pstmt = conn.prepareStatement(query);
				
			pstmt.setString(1, grade);
			pstmt.setString(2,  id);
			 
			result = pstmt.executeUpdate();		
		} catch(Exception e){
			System.out.println("Exception [updateMember]: " + e.getMessage());
			e.printStackTrace();
		}
			
		return result;
	}
	
	public int updateProfile(String id,String comment,String profileimg) { // member 테이블에 id와 관련된 grade 데이터 수정
		int result = 0;
		String query = "UPDATE member SET comment=?,profileimg=? WHERE id=?";
		 
		try {
			pstmt = conn.prepareStatement(query);
				
			pstmt.setString(1, comment);
			pstmt.setString(2, profileimg);
			pstmt.setString(3,  id);
			
			result = pstmt.executeUpdate();		
		} catch(Exception e){
			System.out.println("Exception [updateMember]: " + e.getMessage());
			e.printStackTrace();
		}
			
		return result;
	}
	 
	 public int updateMemberResetPassword(String id, String password) { // member 테이블에 id와 관련된 password 데이터 수정
		 int result = 0;
		 String query = "UPDATE member SET password=? WHERE id=?";
		 
		 try {
			 pstmt = conn.prepareStatement(query);
			 
			 pstmt.setString(1, password);
			 pstmt.setString(2, id);
			 
			 result = pstmt.executeUpdate();
		 } catch(Exception e) {
			 System.out.println("Exception [updateMemberResetPassword]: " + e.getMessage());
			 e.printStackTrace();
		 }
		 return result;
	 }
	 
	 
	 //프로필 이미지 설정 찾아서 가져오기 
	 public MemberDTO selectMemberProfile(String id) { // member 테이블에 name, email과 관련된 id 추출
			String result = "";
			String query = "SELECT * FROM member WHERE id=?";
			MemberDTO dto = new MemberDTO();
			try { 
				 
	        	pstmt = conn.prepareStatement(query);
	             
	            pstmt.setString(1, id);
	       
	            rs = pstmt.executeQuery();             
	            if (rs.next())	           
	            dto.setProfileimg(rs.getString("profileimg"));
	            dto.setComment(rs.getString("comment"));
	        } catch(Exception e) {
	        	System.out.println("Exception [selectMemberFindId]: " + e.getMessage());
	            e.printStackTrace();
	        }
			 
			return dto;
		}
	 
	 
		public int updateMemberProfile(String id, String grade) { // member 테이블에 id와 관련된 grade 데이터 수정
			int result = 0;
			String query = "UPDATE member SET grade=? WHERE id=?";
			 
			try {
				pstmt = conn.prepareStatement(query);
					
				pstmt.setString(1, grade);
				pstmt.setString(2,  id);
				
				result = pstmt.executeUpdate();		
			} catch(Exception e){
				System.out.println("Exception [updateMember]: " + e.getMessage());
				e.printStackTrace();
			}
				
			return result;
		}
}