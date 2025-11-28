package frozen.board.dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import frozen.board.dto.BoardDTO;
import frozen.board.utils.DBConnPool;

public class BoardDAO extends DBConnPool {
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		try {
			String query = "SELECT count(*) FROM FROZENBBS_BOARD ";
			if (map.get("searchWord") != null) {
				query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
			}
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}

	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		List<BoardDTO> boardList = new Vector<>();
		
		String query = " SELECT * FROM (" 
			+ "	SELECT Tb.*, ROWNUM rNum FROM( " 
			+ "		SELECT * FROM FROZENBBS_BOARD ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") 
			+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		query += " ORDER BY idx DESC " 
				+ " )TB " + ")" 
				+ "WHERE rNum BETWEEN ? AND ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getInt("visitcount"));
				boardList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return boardList;
	}
	
	
	/* 미구현 부분 ( 쓰기 보기 갱신 조회수 삭제 다운로드 횟수 업로드 )
	 
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO FROZENBBS_BOARD("
					+ "idx, name, title, content, ofile, sfile, pass)"
					+ " VALUES ("
					+ "seq_board_num.NEXTVAL ,?,?,?,?,?,?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	public BoardDTO selectView(String idx) {
		BoardDTO dto = new BoardDTO();
		String query = "SELECT * FROM FROZENBBS_BOARD WHERE idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getInt("visitcount"));
			}
		}catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	public void updateVisitCount(String idx) {
		String query = "UPDATE FROZENBBS_BOARD "
				+ "SET visitcount = visitcount+1 "
				+ "WHERE idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	public void downCountPlus(String idx) {
		String sql = "UPDATE FROZENBBS_BOARD "
				+ "SET downcount = downcount+1 "
				+ "WHERE idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("다운로드 횟수 업데이트중 오류 발생");
			e.printStackTrace();
		}
	}
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr = true;
		try {
			// 게시글의 번호와 비밀번호가 일치하는 데이터가 있는지 확인하는 SQL
			String sql = "SELECT COUNT(*) FROM FROZENBBS_BOARD WHERE pass=? AND idx=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			rs.next();
			// 데이터가 없으면 false를 반환
			// 데이터가 있으면 true를 반환
			if(rs.getInt(1)==0) {
				isCorr = false;
			}
		}catch(Exception e) {
			isCorr = false;
			e.printStackTrace();
		}
		return isCorr;
	}
	public int deletePost(String idx) {
		int result = 0;
		try {
			String query = "DELETE FROM FROZENBBS_BOARD WHERE idx=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int updatePost(BoardDTO dto) {
		int result = 0;
		try {
			String query = "UPDATE FROZENBBS_BOARD "
					+" SET title=?, name=?, content=?, ofile=?, sfile=? "
					+" WHERE idx=? and pass=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	 
	 */
	
	
}



