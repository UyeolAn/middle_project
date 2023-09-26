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
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;

@WebServlet("/ajaxmemberjindocount.do")
public class AjaxMemberJindoCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxMemberJindoCount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper().registerModule(new JavaTimeModule());
		MemberCourseService dao = new MemberCourseServiceImpl();
		MemberCourseVO vo = new MemberCourseVO();
		
		vo.setCourseId(Integer.valueOf(request.getParameter("courseId")));
		vo.setMemberId(request.getParameter("memberId"));
		
		
		Map<String, String> messageMap = new HashMap<String, String>();
		MemberCourseVO tcount = dao.countJindo(vo);
		int result = 0;
		
		if(tcount.getTcnt() > tcount.getCount()) {
			result = dao.memberCourseCount(vo);
			if(result > 0) {
				messageMap.put("message", "success");
			} else {
				messageMap.put("message", "fail");
			}
		} else {
			messageMap.put("message", "full");
		}
		
		
		String text = objectMapper.writeValueAsString(messageMap);
		
		response.setContentType("text/json; charset=UTF-8");
		response.getWriter().append(text);
		return;
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
