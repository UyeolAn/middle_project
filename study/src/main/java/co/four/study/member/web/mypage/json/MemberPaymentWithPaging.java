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

import co.four.study.memberCourse.service.MemberCourseSearchVO;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.PaymentVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;

@WebServlet("/memberpaymentwithpaging.do")
public class MemberPaymentWithPaging extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public MemberPaymentWithPaging() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberCourseService dao = new MemberCourseServiceImpl();
		
		MemberCourseSearchVO searchVO = new MemberCourseSearchVO();
		searchVO.setMemberId(request.getParameter("memberId"));
		searchVO.setSortType(request.getParameter("sortType"));
		
		int totalCount = dao.countPayments(searchVO);
		int page = Integer.parseInt(request.getParameter("page"));
		int start = (page - 1) * 5 + 1;
		int end = (page * 5) < totalCount ? (page * 5) : totalCount;
		
		searchVO.setStartRow(start);
		searchVO.setEndRow(end);
		
		List<PaymentVO> payments = dao.selectPaymentWithPaging(searchVO);
		System.out.println(payments);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String questionsJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(payments);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(questionsJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
