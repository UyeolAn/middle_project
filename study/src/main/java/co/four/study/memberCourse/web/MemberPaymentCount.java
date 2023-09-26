package co.four.study.memberCourse.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.memberCourse.service.MemberCourseSearchVO;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;

@WebServlet("/memberpaymentcount.do")
public class MemberPaymentCount extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public MemberPaymentCount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberCourseService dao = new MemberCourseServiceImpl();
		
		MemberCourseSearchVO searchVO = new MemberCourseSearchVO();
		searchVO.setMemberId(request.getParameter("memberId"));
		
		int cnt = dao.countPayments(searchVO);
		
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
