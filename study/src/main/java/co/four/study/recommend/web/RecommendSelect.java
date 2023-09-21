package co.four.study.recommend.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.recommend.service.RecommendService;
import co.four.study.recommend.service.RecommendVO;
import co.four.study.recommend.serviceImpl.RecommendServiceImpl;

@WebServlet("/recommendselect.do")
public class RecommendSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RecommendSelect() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RecommendService dao = new RecommendServiceImpl();
		
		RecommendVO dto = new RecommendVO();
		dto.setMemberId((String)session.getAttribute("loginId"));
		dto.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		
		RecommendVO selectedVO = dao.recommendSelect(dto);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String recommendJson = objectMapper.writeValueAsString(selectedVO);
		System.out.println(recommendJson);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(recommendJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
