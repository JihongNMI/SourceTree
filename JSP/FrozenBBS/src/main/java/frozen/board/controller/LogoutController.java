package frozen.board.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout.do")
public class LogoutController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션이 있으면 가져오고, 없으면 새로 만들지 않음 (null 반환)
	    HttpSession session = req.getSession(false); 
	    
	    // session 객체가 실제로 존재할 때만 무효화 (null 체크)
	    if (session != null) {
	        session.invalidate(); // [모든 속성 삭제 + 세션 무효화]
	    }
	    
		System.out.println(req.getContextPath());
		
		// 로그인 페이지로 이동
		resp.sendRedirect("/");
	}
}




