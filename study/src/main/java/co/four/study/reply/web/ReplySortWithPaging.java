package co.four.study.reply.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.four.study.reply.service.ReplyService;
import co.four.study.reply.service.ReplyVO;
import co.four.study.reply.service.etcvo.ReplySortVO;
import co.four.study.reply.serviceImpl.ReplyServiceImpl;

@WebServlet("/replysortwithpaging.do")
public class ReplySortWithPaging extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public ReplySortWithPaging() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyService dao = new ReplyServiceImpl();
		
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		ReplySortVO sortVO = new ReplySortVO();
		sortVO.setBoardId(boardId);
		sortVO.setSortType(request.getParameter("sortType"));
		
		int totalCount = dao.countBoardReply(boardId);
		int page = Integer.parseInt(request.getParameter("page"));
		int start = (page - 1) * 10 + 1;
		int end = (page * 10) < totalCount ? (page * 10) : totalCount;
		
		sortVO.setStartRow(start);
		sortVO.setEndRow(end);
		
		List<ReplyVO> replies = dao.sortRepliesWithPaging(sortVO);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String boardsJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(replies);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(boardsJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
