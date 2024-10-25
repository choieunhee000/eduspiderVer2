package category;

import java.util.ArrayList;
import java.util.List;

import board_ver3.BoardDTO;
import member.MemberDTO;
import util.DatabaseUtil;
 
public class CategoryDAO extends DatabaseUtil {
	
	public int selectCategoryCount(String id) {
		int result = 0;
		String query = "SELECT COUNT(category) FROM category WHERE id=?";
		
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
	
	public List<CategoryDTO> getListDAO(String id)
	{
		List<CategoryDTO> CategoryList = new ArrayList<>(); 
		try
		{
			String SQL = "SELECT * FROM category WHERE id='"+id+"'";
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				CategoryDTO dto = new CategoryDTO();
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setId(rs.getString("id"));
				
				
				CategoryList.add(dto);
			}
			
			
		} catch(Exception e){
			System.out.println("Exception [getListDAO]: " + e.getMessage());
			e.printStackTrace();
		}
		return CategoryList;
	}
	
	
	
	public int searchCategory(String kate,String id) {
		String SQL = "SELECT category FROM category WHERE id='"+id+"' and category='"+kate+"'";
		System.out.println("dao영"+kate);
		System.out.println("dao영"+id);
		try {
			pstmt = conn.prepareStatement(SQL);
			//pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(kate)) {
					return 1;
				}//카테고리가 존재 

			}
			return 0;
				
		} catch(Exception e){
			
			System.out.println("Exception [searchCategory]: " + e.getMessage());
			e.printStackTrace();
			
		}
		
		return -2;
	}
	

	
	
	
	public int insertCategory(CategoryDTO dto) { 
		int result = 0;
					
			String SQL = "INSERT INTO category (Category, id) ";
			SQL += "VALUES (?, ?)";
				
			try {
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1, dto.getCategory());
				pstmt.setString(2, dto.getId()); 

				
				result = pstmt.executeUpdate();		
			} catch(Exception e){
				System.out.println("Exception [insertCategory]: " + e.getMessage());
				e.printStackTrace();
			}
			return result;
			
		}
	
	
//	public  CategoryDTO deleteCategory(CategoryDTO rdto) { 
//		int result = 0;
//					
//			//String SQL = "DELETE FROM Category WHERE id = ? AND Category = ?";
//			String SQL = "DELETE FROM Category WHERE id=? and Category=?";
//			CategoryDTO dto = new CategoryDTO();
//				
//			try {
//				pstmt = conn.prepareStatement(SQL);
//				
//				pstmt.setString(1, rdto.getCategory());
//				pstmt.setString(2, rdto.getId()); 
//				result = pstmt.executeUpdate();		
//				while(rs.next())
//				{
//					
//					dto.setNum(rs.getInt("num"));
//					dto.setCategory(rs.getString("Category"));
//					dto.setId(rs.getString("id"));
//					
//				}
//			} catch(Exception e){
//				System.out.println("Exception [insertMember]: " + e.getMessage());
//				e.printStackTrace();
//			}
//			return dto;
//			
//		}


	public  int deleteCategory(String kate,String id) { 
		int result = 0;
					
			//String SQL = "DELETE FROM Category WHERE id = ? AND Category = ?";
			String SQL = "DELETE FROM category WHERE id='"+id+"' and Category='"+kate+"'";
			//CategoryDTO dto = new CategoryDTO();
				
			try {
				pstmt = conn.prepareStatement(SQL);
//				System.out.println("카테고리"+rdto.getCategory());
//				System.out.println(rdto.getId());
//				pstmt.setString(1, rdto.getId()); 
//				pstmt.setString(2, rdto.getCategory());
				
				result = pstmt.executeUpdate();		
 
			} catch(Exception e){
				System.out.println("Exception [deleteCategory]: " + e.getMessage());
				e.printStackTrace();
			}
			return result;
			
		}
	
	public int updatCategory(String id, String category, String renameCategory) {
		int result = 0;
		String query = "UPDATE category SET category=? WHERE id=? and category=?";
		 
		try {
			pstmt = conn.prepareStatement(query);
				
			pstmt.setString(1, renameCategory);
			pstmt.setString(2, id);
			pstmt.setString(3, category);
			
			result = pstmt.executeUpdate();		
		} catch(Exception e){
			System.out.println("Exception [updatCategory]: " + e.getMessage());
			e.printStackTrace();
		}
			
		return result;
	}
	 
	
	
	//board에 있는 데이터 수 세기 
	public int getCountCategoryDAO(String id) {
		int result = 0;
		String query = "SELECT COUNT(num) FROM category WHERE id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) 
				result = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("Exception [selectMemberNum]: " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	 
	
	
	public ArrayList<CategoryDTO> selectCategory(String id, int startIndex, int endIndex){
        ArrayList<CategoryDTO> arr = new ArrayList<CategoryDTO>();
        
        //limit 시작점, 끝점 전까지 
        String query = "SELECT * FROM category WHERE id=? LIMIT ?, ?";
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setInt(2, startIndex);
            pstmt.setInt(3, endIndex);
            
            rs = pstmt.executeQuery();
             
            while(rs.next()) {
				
				CategoryDTO dto = new CategoryDTO();
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setId(rs.getString("id"));
				
                
                arr.add(dto);
            }
            
        } catch (Exception e) {
            System.out.println("Exception [selectMember]: " + e.getMessage());
            e.printStackTrace();
        }
        
        return arr;
    }
	
}
		
		

	


