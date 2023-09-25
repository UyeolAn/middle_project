package co.four.study.reply.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.reply.service.ReplyService;
import co.four.study.reply.service.ReplyVO;
import co.four.study.reply.serviceImpl.ReplyServiceImpl;

@WebServlet("/replyupdate.do")
public class ReplyUpdate extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public ReplyUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyService dao = new ReplyServiceImpl();
		
		ReplyVO updateVO = new ReplyVO();
		updateVO.setReplyId(Integer.parseInt(request.getParameter("replyId")));
		updateVO.setReplyContent(request.getParameter("updateContent"));
		
		int numUpd = dao.replyUpdate(updateVO);
		Map<String, String> messageMap = new HashMap<>();
		
		if (numUpd != 0) {
			messageMap.put("message", "댓글이 수정되었습니다!!");
		} else {
			messageMap.put("message", "댓글 수정에 실패하였습니다.");
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
