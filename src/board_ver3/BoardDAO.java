package board_ver3;

import java.util.ArrayList;
import java.util.List;

import member.MemberDTO;
import util.DatabaseUtil;

public class BoardDAO extends DatabaseUtil{
	
	
	public int selectRegidateCount(String id) { // regidate의 개수를 중복 없이 반환
		int result = 0;
		String query = "SELECT COUNT(DISTINCT regidate) FROM board WHERE id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("Exception [selectRegidateCount]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	//board 테이블에서 delete과
		public int deleteBoardDAO(String num[])
		{
			int result = 0;
			String SQL = "DELETE FROM board WHERE num=?";
			
			for(int i=0; i < num.length; i++){
				try
				{
					
					pstmt = conn.prepareStatement(SQL);
					
					pstmt.setString(1, num[i]);
					pstmt.executeUpdate(); 
					
					result = 1;
					
					
				} catch(Exception e){
					System.out.println("Exception [deleteBoardDAO]: " + e.getMessage());
					e.printStackTrace();
				}
				
			}
			
			return result;
		}
		
		//board에 있는 데이터 수 세기 
		public int getCountWithCategoryDAO(String category, String id) {
			int result = 0;
			String query = "SELECT COUNT(num) FROM board WHERE id=? and category=?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, category);
				rs = pstmt.executeQuery();
				if(rs.next()) 
					result = rs.getInt(1);
			} catch(Exception e) {
				System.out.println("Exception [selectMemberNum]: " + e.getMessage());
				e.printStackTrace();
			}
			
			return result;
		}
		
		
		public List<BoardDTO> getListWithCategoryDAO(String id, String category)
		{ 
			
			List<BoardDTO> boardList = new ArrayList<>(); 
			try
			{
				String SQL = "select * from board where id='"+id+"' and category='"+category+"'";
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while(rs.next())
				{
					BoardDTO dto = new BoardDTO();
					dto.setNum(rs.getInt("num"));
					dto.setKeyword(rs.getString("keyword")); 
					dto.setSite(rs.getString("site"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content")); 
					dto.setLink(rs.getString("link"));
					dto.setCategory(rs.getString("category"));
					
					boardList.add(dto);
				}
				
				
			} catch(Exception e){
				System.out.println("Exception [getListWithCategoryDAO]: " + e.getMessage());
				e.printStackTrace();
			}
			return boardList;
		}
		
		public ArrayList<BoardDTO> selectBoard(String id, String category, int startIndex, int endIndex){
		        ArrayList<BoardDTO> arr = new ArrayList<BoardDTO>();
		        
		        //limit 시작점, 끝점 전까지 
		        String query = "SELECT * FROM board WHERE id=? and category=? LIMIT ?, ?";
		        
		        try {
		            pstmt = conn.prepareStatement(query);
		            pstmt.setString(1, id);
		            pstmt.setString(2, category);
		            pstmt.setInt(3, startIndex);
		            pstmt.setInt(4, endIndex);
		            
		            rs = pstmt.executeQuery();
		             
		            while(rs.next()) {
		            	BoardDTO dto = new BoardDTO();
						dto.setNum(rs.getInt("num"));
						dto.setKeyword(rs.getString("keyword"));
						dto.setSite(rs.getString("site"));
						dto.setTitle(rs.getString("title"));
						dto.setContent(rs.getString("content")); 
						dto.setLink(rs.getString("link"));
						dto.setCategory(rs.getString("category"));
		                
		                arr.add(dto);
		            }
		            
		        } catch (Exception e) {
		            System.out.println("Exception [selectMember]: " + e.getMessage());
		            e.printStackTrace();
		        }
		        
		        return arr;
		    }
	
}
