package frozen.board.dao;

import java.sql.SQLException;

import frozen.board.dto.MemberDTO;
import frozen.board.utils.DBConnPool;

// DBConnPool을 상속받아 변수를 따로 선언하지 않아도 DB관련 객체를 자유롭게 사용할 수 있음
public class MemberDAO extends DBConnPool{
	
	// 한명의 멤버를 찾아서 MemberDTO에 담아 돌려주는 메서드, 로그인 처리
	public MemberDTO getMemberDTO(String uid, String upass) {
		// 반환값 설정
		MemberDTO dto = new MemberDTO();
		// SQL 작성
		String query = "SELECT * FROM FROZENBBS_MEMBER WHERE id=? AND pass=?";
		try {
			// SQL 실행
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			// 데이터가 1건 검색된다면 실행되는 이프문
			// 데이터가 없다면 디 티 오 의 모든 값은 널 설정됨
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
				dto.setMood(rs.getString(5));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		// 검색 결과를 반환하는 리턴 문
		return dto;
	}
	public int addMember(String id, String pass, String name) {
		String sql = "INSERT INTO FROZENBBS_MEMBER(id,pass,name,regidate)" 
		          + " VALUES(?, ?,   ?   ,sysdate)";
		
		int inResult = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id); // 첫번째 ?의 값 설정
			psmt.setString(2, pass);// 두번째 ?의 값 설정
			psmt.setString(3, name);// 세번째 ?의 값 설정
			// executeUpdate() : INSERT, UPDATE, DELETE문을 실행하는 메서드

			inResult = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally {
			// PreparedStatement 자원 반납
	        try {
	            if (psmt != null) {
	                psmt.close(); // psmt가 null이 아닐 때만 닫기
	                System.out.println("psmt 닫힘");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		}
		return inResult;
		
	}
}
