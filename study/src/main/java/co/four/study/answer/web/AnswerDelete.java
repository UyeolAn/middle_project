package co.four.study.answer.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.answer.service.AnswerService;
import co.four.study.answer.service.AnswerVO;
import co.four.study.answer.serviceImpl.AnswerServiceImpl;

@WebServlet("/answerdelete.do")
public class AnswerDelete extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public AnswerDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnswerService dao = new AnswerServiceImpl();
		
		AnswerVO deleteVO = new AnswerVO();
		deleteVO.setAnswerId(Integer.parseInt(request.getParameter("answerId")));
		
		int numDel = dao.answerDelete(deleteVO);
		Map<String, String> messageMap = new HashMap<>();
		
		if (numDel != 0) {
			messageMap.put("message", "답변이 삭제되었습니다!!");
		} else {
			messageMap.put("message", "답변 삭제에 실패하였습니다.");
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
