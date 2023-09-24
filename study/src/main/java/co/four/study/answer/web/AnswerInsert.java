package co.four.study.answer.web;

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

import co.four.study.answer.service.AnswerService;
import co.four.study.answer.service.AnswerVO;
import co.four.study.answer.serviceImpl.AnswerServiceImpl;

@WebServlet("/answerinsert.do")
public class AnswerInsert extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public AnswerInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		AnswerService dao = new AnswerServiceImpl();
		
		int questionId = Integer.parseInt(request.getParameter("questionId"));
		
		AnswerVO insertVO = new AnswerVO();
		insertVO.setMemberId((String)session.getAttribute("loginId"));
		insertVO.setQuestionId(questionId);
		insertVO.setAnswerContent(request.getParameter("answerContent"));
		
		int numIns = dao.answerInsert(insertVO);
		Map<String, String> messageMap = new HashMap<>();
		
		if (numIns != 0) {
			messageMap.put("message", "답변이 추가가 되었습니다");
		} else {
			messageMap.put("message", "답변 추가에 실패하였습니다.");
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
