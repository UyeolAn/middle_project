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
import co.four.study.member.service.MemberService;
import co.four.study.member.serviceImpl.MemberServiceImpl;

@WebServlet("/answersortwithpaging.do")
public class AnswerSortWithPaging extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public AnswerSortWithPaging() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnswerService answerDao = new AnswerServiceImpl();
		MemberService memberDao = new MemberServiceImpl();
		
		int questionId = Integer.parseInt(request.getParameter("questionId"));
		
		AnswerSortVO sortVO = new AnswerSortVO();
		sortVO.setQuestionId(questionId);
		sortVO.setSortType(request.getParameter("sortType"));
		
		int totalCount = answerDao.countQuestionAnswer(questionId);
		int page = Integer.parseInt(request.getParameter("page"));
		int start = (page - 1) * 10 + 1;
		int end = (page * 10) < totalCount ? (page * 10) : totalCount;
		
		sortVO.setStartRow(start);
		sortVO.setEndRow(end);
		
		List<AnswerVO> answers = answerDao.sortAnswersWithPaging(sortVO);
		for (AnswerVO answer : answers) {
			String memberAuthor = memberDao.selectMemberAuthor(answer.getMemberId());
			answer.setMemberAuthor(memberAuthor);
		}
		
		ObjectMapper objectMapper = new ObjectMapper();
		String boardsJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(answers);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(boardsJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
