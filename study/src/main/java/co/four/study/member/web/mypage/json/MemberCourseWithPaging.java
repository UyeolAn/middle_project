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

import co.four.study.course.service.CourseSearchVO;
import co.four.study.course.service.CourseVO;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;

@WebServlet("/membercoursewithpaging.do")
public class MemberCourseWithPaging extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberCourseWithPaging() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberCourseService dao = new MemberCourseServiceImpl();
		
		CourseSearchVO searchVO = new CourseSearchVO();
		searchVO.setMemberId(request.getParameter("memberId"));
		searchVO.setSortType(request.getParameter("sortType"));
		
		int totalCount = dao.countMemberCourses(searchVO);
		int page = Integer.parseInt(request.getParameter("page"));
		int start = (page - 1) * 9 + 1;
		int end = (page * 9) < totalCount ? (page * 9) : totalCount;
		
		searchVO.setStartRow(start);
		searchVO.setEndRow(end);
		
		List<CourseVO> courses = dao.selectCourseWithPaging(searchVO);
		System.out.println(courses);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String questionsJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(courses);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(questionsJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
