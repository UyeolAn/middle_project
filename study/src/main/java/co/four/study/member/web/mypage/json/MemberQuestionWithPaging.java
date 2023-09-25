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

import co.four.study.answer.service.AnswerService;
import co.four.study.answer.serviceImpl.AnswerServiceImpl;
import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.service.etcvo.QuestionSearchVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;

@WebServlet("/memberquestionwithpaging.do")
public class MemberQuestionWithPaging extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public MemberQuestionWithPaging() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionService questionDao = new QuestionServiceImpl();
		AnswerService answerDao = new AnswerServiceImpl();
		
		QuestionSearchVO searchVO = new QuestionSearchVO();
		searchVO.setSolveType(request.getParameter("solveType"));
		searchVO.setMemberId(request.getParameter("memberId"));

		int totalCount = questionDao.countQuestions(searchVO);
		int page = Integer.parseInt(request.getParameter("page"));
		int start = (page - 1) * 10 + 1;
		int end = (page * 10) < totalCount ? (page * 10) : totalCount;
		
		searchVO.setStartRow(start);
		searchVO.setEndRow(end);
		
		List<QuestionVO> questions = questionDao.searchQuestionsWithPaging(searchVO);
		
		for (QuestionVO question : questions) {	
			int aCnt =  answerDao.countQuestionAnswer(question.getQuestionId());
			question.setAnswerCount(aCnt);
		}
		
		ObjectMapper objectMapper = new ObjectMapper();
		String questionsJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(questions);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(questionsJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
