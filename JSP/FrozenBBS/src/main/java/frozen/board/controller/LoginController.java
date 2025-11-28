package frozen.board.controller;

import java.io.IOException;

import frozen.board.dto.MemberDTO;
import frozen.board.service.LoginService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login.do")
public class LoginController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	LoginService service = new LoginService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//화면만을 출력하는 doGet
		req.getRequestDispatcher("login.jsp")
		.forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// request에서 id, pw를 저장
		String userId = req.getParameter("user_id");
		String userPwd = req.getParameter("user_pw");
		MemberDTO dto = service.getMember(userId, userPwd);
		
		String rememberme = req.getParameter("rememberme");
		
		if(dto.getId() != null){
			// 세션에 각 정보 입력
			req.getSession().setAttribute("UserId", dto.getId());
			req.getSession().setAttribute("UserName", dto.getName());
			req.getSession().setAttribute("UserMood", dto.getMood());
			req.getSession().setAttribute("UserRegidate", dto.getRegidate());
			
			// 체크되면 세션을 30일(30 * 24 * 60 * 60초) 동안 유지 (2592000초) : 쿠키 추가해야하는데 아직 안함
			 if ("forever".equals(rememberme)) {
				 req.getSession().setMaxInactiveInterval(30 * 24 * 60 * 60);
			 }
			
			// 확인코드
			int currentInterval = req.getSession().getMaxInactiveInterval();
			System.out.println("세션 만료 시간 설정 현재 값: " + currentInterval);

			
			// 세션(1회용)에 로그인 성공 환영 입력
			req.getSession().setAttribute("flashMessage", "로그인 성공! 환영합니다.");
			
			// 세션에 로그인 상태 입력
			req.getSession().setAttribute("isLoggedIn", true);
			
			// sendRedirect 사용시 WebServlet에 사용한 주소를 입력
			// /login.do : http://localhost:8080/login.do
			// login.do : http://localhost:8080/MustHaveJSP/login.do
			resp.sendRedirect("/list.do");
			
		}else{
			//일치하지 않으면 로그인 오류 출력
			req.setAttribute("LoginErrMsg", "로그인 오류입니다.");
			// forward에는 반드시 JSP의 정확한 경로를 입력해야함
			// webapp을 기준으로 jsp파일의 위치를 작성
			// 슬러시(/) 하나만 했을경우에 webapp에 위치하게 됨
			req.getRequestDispatcher("login.jsp")
			//경로
				.forward(req, resp);
		}
	}
}