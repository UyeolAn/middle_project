package co.four.study.board.web.json;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.board.service.BoardService;
import co.four.study.board.service.etcvo.BoardSearchVO;
import co.four.study.board.serviceImpl.BoardServiceImpl;

@WebServlet("/boardcount.do")
public class BoardCount extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardCount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService dao = new BoardServiceImpl();
		
		BoardSearchVO searchVO = new BoardSearchVO();
		searchVO.setSearchType(request.getParameter("searchType"));
		searchVO.setSearchContent(request.getParameter("searchContent"));
		searchVO.setSortType(request.getParameter("sortType"));
		
		int cnt = dao.countBoards(searchVO);
		
		Map<String, Integer> cntMap = new HashMap<>();
		cntMap.put("totalCount", cnt);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String messageJson = objectMapper.writeValueAsString(cntMap);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(messageJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
