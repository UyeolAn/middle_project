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
import co.four.study.question.service.QuestionService;
import co.four.study.question.service.etcvo.QuestionSolveVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;

@WebServlet("/answernotsolved.do")
public class AnswerNotSolved extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public AnswerNotSolved() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnswerService answerDao = new AnswerServiceImpl();
		QuestionService questionDao = new QuestionServiceImpl();
		
		AnswerVO dto = new AnswerVO();
		dto.setAnswerId(Integer.parseInt(request.getParameter("answerId")));
		
		int numUpd = answerDao.setAnswerNotSolved(dto);
		Map<String, String> messageMap = new HashMap<>();
		
		if (numUpd != 0) {
			int questionId = Integer.parseInt(request.getParameter("questionId"));
			
			QuestionSolveVO solveVO = new QuestionSolveVO();
			solveVO.setQuestionId(questionId);
			
			int solveAnswerCnt = answerDao.countQuestionSolvedAnswer(questionId);
			if (solveAnswerCnt == 0) {
				solveVO.setQuestionSolve("not_solved");
			} else {
				solveVO.setQuestionSolve("solved");
			}
			
			questionDao.updateQuestionSolve(solveVO);
			
			messageMap.put("message", "해결여부가 반영되었습니다!");
			
			ObjectMapper objectMapper = new ObjectMapper();
			String messageJson = objectMapper.writeValueAsString(messageMap);
			
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().print(messageJson);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
