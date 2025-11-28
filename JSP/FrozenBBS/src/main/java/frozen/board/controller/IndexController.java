package frozen.board.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("") // 이거때문에 몇시간을 들였지
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 세션에서 로그인 여부 확인
        HttpSession session = req.getSession();
        Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
        
        //요청 URL 확인
        String requestURI = req.getRequestURI();
        
        // *** 디버깅 코드 추가 ***
        System.out.println("1----여기는 /입니다 ----------------------");
        System.out.println("요청 URI: " + requestURI);
        System.out.println("세션 isLoggedIn 상태: " + isLoggedIn);
        System.out.println("2-------------------------------------");
        
        // 1-1. 로그인되지 않았다면(로그인 null or false) && 주소가 /이면 -> 인덱스 / 로
        if ( (isLoggedIn == null || isLoggedIn == false) &&  requestURI.equals("/") ) {
        	req.getRequestDispatcher("/index.jsp").forward(req, resp);
        	// resp.sendRedirect("/index.jsp"); 리다이렉트가 아니라는데 어느쪽이 맞나
            return;
        }
        
        // 2. 로그인 상태에서 '/'랑 index.jsp로 요청이 들어오면 list.do로 리다이렉트
        else if(isLoggedIn == true && ( requestURI.equals("/") || requestURI.endsWith("/index.jsp") )) { 
			// "/" 또는 "/index.jsp" 요청을 "/list.do"로 리다이렉트
			resp.sendRedirect("/list.do");
			System.out.println("로그인 상태에서 /나 index.jsp를 하면 list.do로 리다이렉트");
			return; // 리다이렉트 후 종료
 		}
        
        System.out.println("위에 else if를 뛰어넘었음");
        
	}
}