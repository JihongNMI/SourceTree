package frozen.board.controller;

import java.io.IOException;

import frozen.board.dao.MemberDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/join.do")
public class JoinController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	// LoginService service = new LoginService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//화면만을 출력하는 doGet
		req.getRequestDispatcher("join.jsp")
		.forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 리퀘스트 에서 id, 패스를 저장
		
		String Id = req.getParameter("user_id");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		
		MemberDAO dao = new MemberDAO();
	    
	    // 1. DAO 메서드를 호출하고 결과를 int result 변수에 저장
		int result = dao.addMember(Id, password, name);;
		dao.close();
		System.out.println("DAO 닫힘");
		
		if (result > 0) {
            // 성공: 로그인 페이지로 이동
			System.out.println(result + "회원가입 성공");
            resp.sendRedirect("login.do");
            
        } else {
            // 실패: 회원가입 페이지(register.do 등으로 가정)로 다시 리다이렉트하거나 오류 메시지 처리
            // 여기서는 단순히 오류가 발생했을 때와 동일하게 예외를 던지지 않는 경우로 처리.
            // 필요에 따라 resp.sendRedirect("register.do?error=fail"); 등의 처리가 필요합니다.
            System.out.println("회원가입 실패: DB에 반영되지 않았습니다.");
        }
			
		
	}
}
