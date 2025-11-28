package frozen.board.service;

import frozen.board.dao.MemberDAO;
import frozen.board.dto.MemberDTO;
//로그인 서비스
public class LoginService {
	public MemberDTO getMember(String userId, String userPwd) {
		MemberDAO dao = new MemberDAO();
		MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
		dao.close();
		return memberDTO;
	}
}
