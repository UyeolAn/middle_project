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
import co.four.study.answer.service.AnswerVO;
import co.four.study.answer.service.etcvo.AnswerSortVO;
import co.four.study.answer.serviceImpl.AnswerServiceImpl;

@WebServlet("/memberanswerwithpaging.do")
public class MemberAnswerWithPaging extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public MemberAnswerWithPaging() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnswerService dao = new AnswerServiceImpl();
		
		String memberId = request.getParameter("memberId");
		
		AnswerSortVO searchVO = new AnswerSortVO();
		searchVO.setMemberId(memberId);
		
		int totalCount = dao.countMemberAnswer(memberId);
		int page = Integer.parseInt(request.getParameter("page"));
		int start = (page - 1) * 10 + 1;
		int end = (page * 10) < totalCount ? (page * 10) : totalCount;
		
		searchVO.setStartRow(start);
		searchVO.setEndRow(end);
		
		List<AnswerVO> answers = dao.sortAnswersWithPaging(searchVO);

		ObjectMapper objectMapper = new ObjectMapper();
		String questionsJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(answers);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(questionsJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
