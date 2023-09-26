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

import co.four.study.course.service.CourseSearchVO;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;

@WebServlet("/membercoursecount.do")
public class MemberCourseCount extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberCourseCount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberCourseService dao = new MemberCourseServiceImpl();
		
		CourseSearchVO searchVO = new CourseSearchVO();
		searchVO.setMemberId(request.getParameter("memberId"));
		
		int cnt = dao.countMemberCourses(searchVO);
		
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
