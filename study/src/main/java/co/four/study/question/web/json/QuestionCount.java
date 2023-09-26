package co.four.study.question.web.json;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.question.service.QuestionService;
import co.four.study.question.service.etcvo.QuestionSearchVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;

@WebServlet("/questioncount.do")
public class QuestionCount extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public QuestionCount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionService dao = new QuestionServiceImpl();
		
		QuestionSearchVO searchVO = new QuestionSearchVO();
		searchVO.setSearchType(request.getParameter("searchType"));
		searchVO.setSearchContent(request.getParameter("searchContent"));
		searchVO.setSearchCourse(request.getParameter("searchCourse"));
		searchVO.setSolveType(request.getParameter("solveType"));
		searchVO.setSortType(request.getParameter("sortType"));
		searchVO.setMemberId(request.getParameter("memberId"));
		
		int cnt = dao.countQuestions(searchVO);
		
		Map<String, Integer> cntMap = new HashMap<>();
		cntMap.put("totalCount", cnt);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String countJson = objectMapper.writeValueAsString(cntMap);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(countJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
