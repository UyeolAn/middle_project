package co.four.study.board.web.json;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.four.study.board.service.BoardService;
import co.four.study.board.service.BoardVO;
import co.four.study.board.serviceImpl.BoardServiceImpl;
import co.four.study.reply.service.ReplyService;
import co.four.study.reply.serviceImpl.ReplyServiceImpl;

@WebServlet("/boardall.do")
public class BoardAll extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public BoardAll() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService boardDao = new BoardServiceImpl();
		ReplyService replyDao = new ReplyServiceImpl();
		
		List<BoardVO> boards = boardDao.boardSelectList(request.getParameter("sortType"));
		for (BoardVO board : boards) {
			int rCnt =  replyDao.countBoardReply(board.getBoardId());
			board.setReplyCount(rCnt);
		}
		
		ObjectMapper objectMapper = new ObjectMapper();
		String boardsJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(boards);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(boardsJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
