package co.four.study.reply.web.json;

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
import co.four.study.reply.serviceImpl.ReplyServiceImpl;

@WebServlet("/replycnt.do")
public class ReplyCnt extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReplyCnt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyService dao = new ReplyServiceImpl();
		int replyCnt = dao.replyCnt(Integer.parseInt(request.getParameter("boardId")));
		
		Map<String, Integer> cntMap = new HashMap<>();
		cntMap.put("replyCnt", replyCnt);

		ObjectMapper objectMapper = new ObjectMapper();
		String cntJson = objectMapper.writeValueAsString(cntMap);
		response.getWriter().print(cntJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
