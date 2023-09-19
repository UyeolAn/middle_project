package co.four.study.course.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;


@WebServlet("/coursenameselect.do")
public class courseNameSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public courseNameSelect() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));
		ObjectMapper objectMapper = new ObjectMapper();
		CourseService dao = new CourseServiceImpl();
		
		CourseVO vo = new CourseVO();
		
		vo.setCourseId(cid);
		
		vo = dao.courseSelect(vo);
		
		Map<String,CourseVO> result = new HashMap<>();
		
//		String name = vo.getCourseName();
		
		result.put("course", vo);
		
		String json = objectMapper.writeValueAsString(result);
		response.setContentType("text/json; charset=UTF-8");
		response.getWriter().print(json);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
