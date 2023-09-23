package co.four.study.reply.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.reply.service.ReplyService;
import co.four.study.reply.service.ReplyVO;
import co.four.study.reply.serviceImpl.ReplyServiceImpl;

@WebServlet("/replyinsert.do")
public class ReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReplyInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		ReplyService dao = new ReplyServiceImpl();
		
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		ReplyVO insertVO = new ReplyVO();
		insertVO.setMemberId((String)session.getAttribute("loginId"));
		insertVO.setBoardId(boardId);
		insertVO.setReplyContent(request.getParameter("replyContent"));
		
		int numIns = dao.replyInsert(insertVO);
		Map<String, String> messageMap = new HashMap<>();
		
		if (numIns != 0) {
			messageMap.put("message", "댓글이 추가되었습니다!!");
		} else {
			messageMap.put("message", "댓글 추가에 실패하였습니다.");
		}
		
		ObjectMapper objectMapper = new ObjectMapper();
		String messageJson = objectMapper.writeValueAsString(messageMap);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(messageJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
