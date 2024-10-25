package board;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardTable extends JDBConnect{
	public BoardTable(ServletContext application) {
		super(application);
	}
	public String searchAllTable(String keyword) {
		System.out.println("모든 테이블 출력 "+keyword);
		String query = "SELECT * FROM tab";
		String table_name = "@@null@@";
		try {
			stmt = con.createStatement();//쿼리문 생성 
			rs = stmt.executeQuery(query);//쿼리 실행 
			
			while(rs.next()){//결과를 순회하며...
				System.out.println("while");
				System.out.println(rs.getString(1));
				if(rs.getString(1).equalsIgnoreCase(keyword)){
					table_name = rs.getString(1); // 첫 번째 컬럼 값을 가져옴
					break;
				}
			}
		}catch(Exception e)
		{
			System.out.println("table 조회중 예외 발생");
			e.printStackTrace();
		}
		System.out.println(table_name+" = @@null@@");
		if(table_name.equals("@@null@@")) {
			return "not exist";
		}
		else
		{
			return "exist";
		}
	}
}
