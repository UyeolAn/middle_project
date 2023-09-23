package co.four.study.question.web.json;

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

@WebServlet("/questionsearchwithpaging.do")
public class QuestionSearchWithPaging extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public QuestionSearchWithPaging() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionService questionDao = new QuestionServiceImpl();
		AnswerService answerDao = new AnswerServiceImpl();
		
		QuestionSearchVO searchVO = new QuestionSearchVO();
		searchVO.setSearchType(request.getParameter("searchType"));
		searchVO.setSearchContent(request.getParameter("searchContent"));
		searchVO.setSearchCourse(request.getParameter("searchCourse"));
		searchVO.setSortType(request.getParameter("sortType"));
		
		int totalCount = questionDao.countQuestions(searchVO);
		int page = Integer.parseInt(request.getParameter("page"));
		int start = (page - 1) * 5 + 1;
		int end = (page * 5) < totalCount ? (page * 5) : totalCount;
		
		searchVO.setStartRow(start);
		searchVO.setEndRow(end);
		
		List<QuestionVO> questions = questionDao.searchQuestionsWithPaging(searchVO);
		
		for (QuestionVO question : questions) {
			question.setCourseName(questionDao.getQuestionCourseName(question.getQuestionId())); 
			
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
