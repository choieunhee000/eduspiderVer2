package board_ver2;

//import java.awt.List;
import java.util.ArrayList;
import java.util.List;
import java.util.ArrayList;

import util.DatabaseUtil;

public class TemporaryBoardDAO extends DatabaseUtil {

	public void createBoard(String id) { // 임시 테이블 생성
		String query = "CREATE TABLE " + id + " ("
					 + "	num INT AUTO_INCREMENT PRIMARY KEY,"
					 + "	keyword VARCHAR(300),"
					 + "	site VARCHAR(10),"
					 + "	title VARCHAR(1000),"
					 + "	content VARCHAR(5000),"
					 + "	link VARCHAR(2000)"
					 + ");";
		try {
			stmt = conn.createStatement();//쿼리문 생성 
			if(stmt.execute(query))
				System.out.println("Create Table Success!!");
			// rs = stmt.executeQuery(query);//쿼리 실행 
		} catch(Exception e) {
			System.out.println("Exception [insertMember]: " + e.getMessage());
			e.printStackTrace();
		}	  
	}  
 
	public int insertBoard(BoardDTO dto) { 
		int result = 0;
			String tableName = dto.getTablename();
		//tableName = toSting(dto.getTablename());
		String SQL = "INSERT INTO " + tableName+"(keyword,site,title,content,link)"+ " VALUES (?,?,?,?,?)";
		try { 
			
			//conn = getConnection(); 
			pstmt = conn.prepareStatement(SQL);
			//pstmt.setString(1, dto.getTablename());
			//pstmt.setInt(2, dto.getNum());
			pstmt.setString(1,dto.getKeyword());
			pstmt.setString(2,dto.getSite());
			pstmt.setString(3,dto.getTitle());
			pstmt.setString(4,dto.getContent());
			pstmt.setString(5,dto.getLink());
			 
			
			 
			//pstmt.setString(1, dto.());
//			pstmt.setString(1, dto.getName());
//			pstmt.setString(2, dto.getId()); 
//			pstmt.setString(3, dto.getPassword()); 
//			pstmt.setString(4, dto.getGrade()); 
//			pstmt.setString(5, dto.getNickname()); 
//			pstmt.setString(6, dto.getEmail()); 
//			
			
			result = pstmt.executeUpdate();		
		} catch(Exception e){
			System.out.println("Exception [insertMember]: " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public List<BoardDTO> getListDAO(String tablename)
	{
		String id = tablename;
		List<BoardDTO> boardList = new ArrayList<>(); 
		try
		{
			String SQL = "SELECT * FROM "+tablename;
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
				
				boardList.add(dto);
			}
			
			
		} catch(Exception e){
			System.out.println("Exception [insertMember]: " + e.getMessage());
			e.printStackTrace();
		}
		return boardList;
	}
	
}
