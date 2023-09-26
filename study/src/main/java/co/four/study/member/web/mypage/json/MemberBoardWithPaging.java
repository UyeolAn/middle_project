package co.four.study.member.web.mypage.json;

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
import co.four.study.board.service.etcvo.BoardSearchVO;
import co.four.study.board.serviceImpl.BoardServiceImpl;
import co.four.study.recommend.service.RecommendService;
import co.four.study.recommend.service.etcvo.RecommendCountVO;
import co.four.study.recommend.serviceImpl.RecommendServiceImpl;
import co.four.study.reply.service.ReplyService;
import co.four.study.reply.serviceImpl.ReplyServiceImpl;

@WebServlet("/memberboardwithpaging.do")
public class MemberBoardWithPaging extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public MemberBoardWithPaging() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService boardDao = new BoardServiceImpl();
		ReplyService replyDao = new ReplyServiceImpl();
		RecommendService recommendDao = new RecommendServiceImpl();
		
		BoardSearchVO searchVO = new BoardSearchVO();
		searchVO.setMemberId(request.getParameter("memberId"));
		
		int totalCount = boardDao.countBoards(searchVO);
		int page = Integer.parseInt(request.getParameter("page"));
		int start = (page - 1) * 10 + 1;
		int end = (page * 10) < totalCount ? (page * 10) : totalCount;
		
		searchVO.setStartRow(start);
		searchVO.setEndRow(end);
		
		List<BoardVO> boards = boardDao.searchBoardsWithPaging(searchVO);
		
		for (BoardVO board : boards) {
			int rCnt =  replyDao.countBoardReply(board.getBoardId());
			board.setReplyCount(rCnt);
			
			RecommendCountVO countVO = recommendDao.countRecommend(board.getBoardId());
			board.setBoardLike(countVO.getBoardLike());
			board.setBoardDislike(countVO.getBoardDislike());
		}
		
		ObjectMapper objectMapper = new ObjectMapper();
		String questionsJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(boards);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(questionsJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
