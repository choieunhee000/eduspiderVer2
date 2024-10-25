package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

// DAO: Data Access Object
// DTO: Data Transfer Object

public class DatabaseUtil {

	protected Connection conn;
	protected Statement stmt;
	protected PreparedStatement pstmt;
	protected ResultSet rs;

	public DatabaseUtil() {
		try {
			// mysql 관련 계정 정보와 해당 데이터베이스 스키마를 변수에 저장
			String dbUrl = "jdbc:mysql://localhost:3306/crawling?serverTimezone=UTC";
			String dbId = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			
			// 위에서 저장된 변수를 데이터베이스에 연결
			conn = DriverManager.getConnection(dbUrl, dbId, dbPassword);
			System.out.println("DB 생성자 연결 성공!!");
		} catch (Exception e) {
			System.out.println("Exception [DatabaseUtil]: " + e.getMessage());
			e.printStackTrace();
		}
	}

	public void close() { // db 자원 해제 메소드
		try {
			if(rs != null)rs.close();
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();

			System.out.println("jdbc 자원 해제 ");
		}
		catch(Exception e) {
			System.out.println("Exception [close]: " + e.getMessage());
			e.printStackTrace();
		}
	}
}