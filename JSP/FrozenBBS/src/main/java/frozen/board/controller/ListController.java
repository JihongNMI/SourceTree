package frozen.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import frozen.board.dao.BoardDAO;
import frozen.board.dto.BoardDTO;
import frozen.board.utils.BoardPage;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// @WebServlet({"/", "/list.do"}) 이걸로 하니까 도저히 안되서
@WebServlet("/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 세션에서 로그인 여부 확인
		HttpSession session = req.getSession();
		Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");

		// 요청 URL 확인
		String requestURI = req.getRequestURI();

		System.out.println("1----여기는 /list.do입니다 ----------------------");
		System.out.println("요청 URI: " + requestURI);
		System.out.println("세션 isLoggedIn 상태: " + isLoggedIn);
		System.out.println("2-------------------------------------");

		
		// 1-2. 로그인되지 않았다면(로그인 null or false) && 주소가 list.do이면 -> login.do로
		// Future Plan : 사실 로그인 안했어도 일부 DB만 랜덤하게 보여주는 기능으로 할 예정
		
		if ((isLoggedIn == null || isLoggedIn == false)) {
			// 로그인되지 않았다면 그냥 페이지로 리다이렉트
			resp.sendRedirect("/");
			System.out.println("list.do에서 /로 리다이렉트");
			return;
		}

		// 2. 로그인 상태면 DAO

		if (isLoggedIn == true) {

			BoardDAO dao = new BoardDAO();
			Map<String, Object> map = new HashMap<>();
			String searchField = req.getParameter("searchField");
			String searchWord = req.getParameter("searchWord");
			if (searchWord != null) {
				map.put("searchField", searchField);
				map.put("searchWord", searchWord);
			}
			int totalCount = dao.selectCount(map);

			// web.xml에 저장한 데이터를 사용
			ServletContext application = getServletContext();
			int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
			int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

			int pageNum = 1;
			String pageTemp = req.getParameter("pageNum");
			if (pageTemp != null && !pageTemp.equals("")) {
				pageNum = Integer.parseInt(pageTemp);
			}

			int start = (pageNum - 1) * pageSize + 1;
			int end = pageNum * pageSize;
			map.put("start", start);
			map.put("end", end);

			List<BoardDTO> boardLists = dao.selectListPage(map);
			dao.close();

			// boardLists로 DB 전송
			req.setAttribute("boardLists", boardLists);


			// 페이징
			String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, requestURI);
			map.put("pagingImg", pagingImg);
			map.put("totalCount", totalCount);
			map.put("pageSize", pageSize);
			map.put("pageNum", pageNum);
			
			// 페이지에 필요한 모든 데이터를 map으로 전송
			req.setAttribute("map", map);
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
		System.out.println("ListController에서 DB List와 페이지map을 받아옴");
	}
}
