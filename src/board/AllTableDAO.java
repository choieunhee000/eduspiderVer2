package board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class AllTableDAO extends JDBConnect{
	public AllTableDAO(ServletContext application) {
		super(application);
	}
	
	public int searchAllTable() {
		int totalCount = 0;//결과(게시물 수)를 담을 변수 
		
			//게시물 수를 얻어오는 쿼리문 작성                                   
			String query = "SELECT COUNT(*) FROM tab";
			
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				rs.next();
				totalCount = rs.getInt(1); // 첫 번째 컬럼 값을 가져옴 
				System.out.println(totalCount);
			}
			catch(Exception e)
			{
				System.out.println("전체 게시물 가져오는 중 예외 발생");
				e.printStackTrace();
			}
			
			return totalCount;
	}
	
	
	public List<AllTable> selectList(int totalCount){
		List<AllTable> alltable = new ArrayList<AllTable>();
		
		String query = "SELECT * FROM tab";
		
		try {
			stmt = con.createStatement();//쿼리문 생성 
			rs = stmt.executeQuery(query);//쿼리 실행 
			System.out.println(totalCount);
			while(rs.next()){//결과를 순회하며...
				//한 행(게시물 하나)의 내용을 DTO에 저장
				AllTable tname = new AllTable();
				tname.setTable(rs.getString("tname"));
				
				alltable.add(tname);
			}
		}catch(Exception e)
		{
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return alltable;
		
	}
	
}
