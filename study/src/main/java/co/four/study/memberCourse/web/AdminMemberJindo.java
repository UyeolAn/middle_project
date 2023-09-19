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

import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;


@WebServlet("/adminmemberjindo.do")
public class AdminMemberJindo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminMemberJindo() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberCourseService dao = new MemberCourseServiceImpl();
		MemberCourseVO vo = new MemberCourseVO();
		ObjectMapper objectMapper = new ObjectMapper();
		
		vo.setMemberId(request.getParameter("mid"));
		vo.setCourseId(Integer.parseInt(request.getParameter("cid")));
		
		vo = dao.countJindo(vo);
		double jindo =  ((double)vo.getCount()/vo.getTcnt()) * 100; 
		
		Map<String,Double> result = new HashMap<>();
		
		result.put("jindo", jindo);

		String json = objectMapper.writeValueAsString(result);
		response.setContentType("text/json; charset=UTF-8");
		response.getWriter().print(json);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
