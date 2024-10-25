package board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}

	public int selectCount(String keyword) {
		int totalCount = 0;// 결과(게시물 수)를 담을 변수

		// 게시물 수를 얻어오는 쿼리문 작성
		String query = "SELECT COUNT(*) FROM " + keyword;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1); // 첫 번째 컬럼 값을 가져옴
			System.out.println(totalCount);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}

	public List<BoardDTO> selectList(int totalCount, String keyword) {
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();

		String query = "SELECT * FROM " + keyword;

		try {
			stmt = con.createStatement();// 쿼리문 생성
			rs = stmt.executeQuery(query);// 쿼리 실행
			System.out.println(totalCount);
			while (rs.next()) {// 결과를 순회하며...
				// 한 행(게시물 하나)의 내용을 DTO에 저장
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setSite(rs.getString("site"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setLink(rs.getString("link"));

				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
}