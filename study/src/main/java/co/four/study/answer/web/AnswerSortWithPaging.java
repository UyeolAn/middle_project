package co.four.study.answer.web;

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
import co.four.study.answer.service.AnswerVO;
import co.four.study.answer.service.etcvo.AnswerSortVO;
import co.four.study.answer.serviceImpl.AnswerServiceImpl;

@WebServlet("/answersortwithpaging.do")
public class AnswerSortWithPaging extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public AnswerSortWithPaging() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnswerService dao = new AnswerServiceImpl();
		
		int questionId = Integer.parseInt(request.getParameter("questionId"));
		
		AnswerSortVO sortVO = new AnswerSortVO();
		sortVO.setQuestionId(questionId);
		sortVO.setSortType(request.getParameter("sortType"));
		
		int totalCount = dao.countQuestionAnswer(questionId);
		int page = Integer.parseInt(request.getParameter("page"));
		int start = (page - 1) * 10 + 1;
		int end = (page * 10) < totalCount ? (page * 10) : totalCount;
		
		sortVO.setStartRow(start);
		sortVO.setEndRow(end);
		
		List<AnswerVO> replies = dao.sortAnswersWithPaging(sortVO);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String boardsJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(replies);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(boardsJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
