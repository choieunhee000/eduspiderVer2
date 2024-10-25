package board_ver3;

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
					 + "	link VARCHAR(2000),"
					 + "	category VARCHAR(300)"
					 + ");";
		try {
			stmt = conn.createStatement();//쿼리문 생성 
			if(stmt.execute(query))
				System.out.println("Create Table Success!!");
			// rs = stmt.executeQuery(query);//쿼리 실행 
		} catch(Exception e) {
			System.out.println("Exception [createBoard]: " + e.getMessage());
			e.printStackTrace();
		}	  
	}   
 
	public int insertBoard(BoardDTO dto) { 
		int result = 0;
			String tableName = dto.getTablename();
		//tableName = toSting(dto.getTablename());
		String SQL = "INSERT INTO " + tableName+"(keyword,site,title,content,link,category)"+ " VALUES (?,?,?,?,?,?)";
		try { 
			
			//conn = getConnection(); 
			pstmt = conn.prepareStatement(SQL);
	
			pstmt.setString(1,dto.getKeyword());
			pstmt.setString(2,dto.getSite());
			pstmt.setString(3,dto.getTitle());
			pstmt.setString(4,dto.getContent());
			pstmt.setString(5,dto.getLink());
			pstmt.setString(6,dto.getCategory());
			 
			

			
			result = pstmt.executeUpdate();		
		} catch(Exception e){
			System.out.println("Exception [insertBoard]: " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	//임시테이블 전체 내용 출력 / 크롤링 바로 다음에 사용 
	public List<BoardDTO> getListDAO(String tablename)
	{
		String id = tablename;
		System.out.println(tablename);
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
				dto.setCategory(rs.getString("category"));
				
				boardList.add(dto);
			}
			
			
		} catch(Exception e){
			System.out.println("Exception [getListDAO]: " + e.getMessage());
			e.printStackTrace();
		}
		return boardList;
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
	
	
	
	//임시테이블에서 선택한 data만 가져오는 과정 /임시 테이블 생성 다음 과정 
	public List<BoardDTO> selectBoardDAO(String num[],String tablename)
	{
		//String id = tablename;
		
		List<BoardDTO> boardList = new ArrayList<>(); 
		
		for(int i=0; i < num.length; i++){
			try
			{
				String SQL = "SELECT * FROM "+tablename+ " WHERE num="+num[i];
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while(rs.next())
				{
					BoardDTO dto = new BoardDTO();
//					dto.setNum(rs.getInt("num"));
					dto.setKeyword(rs.getString("keyword"));
					dto.setSite(rs.getString("site"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setLink(rs.getString("link"));
					dto.setCategory(rs.getString("category"));
					
					boardList.add(dto);
				}
				
				
			} catch(Exception e){
				System.out.println("Exception [insertMember]: " + e.getMessage());
				e.printStackTrace();
			}
			
		}
		
		return boardList;
	}
	
	
	public int insertBoardDAO(List<BoardDTO> boardList,String id) { 
		int result = 0;
		BoardDTO dto = new BoardDTO();
		for(BoardDTO f : boardList){
//			
//			INSERT INTO board (keyword, site, title, content, regidate, link, id, kategorie)
//			VALUES ('test keyword', 'example.com', 'Test Title', 'This is a test content.', '2023-06-23 09:30:00', 'http://example.com/test', 'Alice123', 'Sample Category');

			String SQL = "INSERT INTO board (keyword, site, title, content, regidate, link, id, kategorie) VALUES (?,?,?,?,NOW(),?,?,?)";
			try { 
				
				//conn = getConnection(); 
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1,f.getKeyword());
				pstmt.setString(2,f.getSite());
				pstmt.setString(3,f.getTitle());
				pstmt.setString(4,f.getContent());
				pstmt.setString(5,f.getLink());
				pstmt.setString(6,id);
				pstmt.setString(7,f.getCategory());
//				pstmt.setString(7,id);
				
				result = pstmt.executeUpdate();		
			} catch(Exception e){
				System.out.println("Exception [insertMember]: " + e.getMessage());
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	
	public int insertBoardDAO(List<BoardDTO> boardList,String id, String category) { 
		int result = 0;
		for(BoardDTO f : boardList){
//			
//			INSERT INTO board (keyword, site, title, content, regidate, link, id, kategorie)
//			VALUES ('test keyword', 'example.com', 'Test Title', 'This is a test content.', '2023-06-23 09:30:00', 'http://example.com/test', 'Alice123', 'Sample Category');

			String SQL = "INSERT INTO board (keyword, site, title, content, regidate, link, id, category) VALUES (?,?,?,?,NOW(),?,?,?)";
			try { 
				
				//conn = getConnection(); 
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1,f.getKeyword());
				pstmt.setString(2,f.getSite());
				pstmt.setString(3,f.getTitle()); 
				pstmt.setString(4,f.getContent());
				pstmt.setString(5,f.getLink());
				pstmt.setString(6,id);
				pstmt.setString(7,category);
				
				result = pstmt.executeUpdate();		
			} catch(Exception e){
				System.out.println("Exception [insertBoardDAO]: " + e.getMessage());
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	
	public void dropTemporaryDAO(String tamporaryTableName) { 
	
		//tableName = toSting(dto.getTablename());
		String SQL = "DROP TABLE " + tamporaryTableName; 
		try { 
			
			//conn = getConnection(); 
			pstmt = conn.prepareStatement(SQL);

			 pstmt.executeUpdate();		
		} catch(Exception e){
			System.out.println("Exception [insertMember]: " + e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
}







































