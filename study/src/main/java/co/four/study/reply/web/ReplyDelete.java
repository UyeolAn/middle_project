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

@WebServlet("/replydelete.do")
public class ReplyDelete extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public ReplyDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyService dao = new ReplyServiceImpl();
		
		ReplyVO deleteVO = new ReplyVO();
		deleteVO.setReplyId(Integer.parseInt(request.getParameter("replyId")));

		int numDel = dao.replyDelete(deleteVO);
		Map<String, String> messageMap = new HashMap<>();
		
		if (numDel != 0) {
			messageMap.put("message", "댓글이 삭제되었습니다!!");
		} else {
			messageMap.put("message", "댓글 삭제에 실패하였습니다.");
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
