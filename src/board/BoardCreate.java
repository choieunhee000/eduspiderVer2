package board;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardCreate extends JDBConnect{
	public BoardCreate(ServletContext application) {
		super(application);
	}
	
	public void findTable(String keyword) {
		System.out.println("모든 테이블 출력 "+keyword);
		String query = "SELECT * FROM tab";
		String table_name = "@@null@@";
		try {
			stmt = con.createStatement();//쿼리문 생성 
			rs = stmt.executeQuery(query);//쿼리 실행 
			
			while(rs.next()){//결과를 순회하며...
				System.out.println("while");
				if(rs.getString(1).equals(keyword)){
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
			System.out.println("create 실행 ");
			query = "CREATE TABLE "+keyword+" ( num number primary key, site varchar2(10) not null, "
					+ "title varchar2(1000) not null, content varchar2(2000) not null, regdate varchar2(15) not null, link varchar(1000) unique not null)";
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
			}
			catch(Exception e)
			{
				System.out.println("table create 중 예외 발생");
				e.printStackTrace();
			}
		}
		
		}
}
