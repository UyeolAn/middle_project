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

@WebServlet("/answerupdate.do")
public class AnswerUpdate extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public AnswerUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnswerService dao = new AnswerServiceImpl();
		
		AnswerVO updateVO = new AnswerVO();
		updateVO.setAnswerId(Integer.parseInt(request.getParameter("answerId")));
		updateVO.setAnswerContent(request.getParameter("answerContent"));
		
		int numUpd = dao.answerUpdate(updateVO);
		Map<String, String> messageMap = new HashMap<>();
		
		if (numUpd != 0) {
			messageMap.put("message", "답변이 수정되었습니다!!");
		} else {
			messageMap.put("message", "답변 수정에 실패하였습니다.");
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
