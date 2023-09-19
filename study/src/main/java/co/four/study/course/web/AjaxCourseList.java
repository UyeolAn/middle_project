package co.four.study.course.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;

@WebServlet("/ajaxCourseList.do")
public class AjaxCourseList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxCourseList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseService dao = new CourseServiceImpl();
		CourseVO vo = new CourseVO();
		ObjectMapper objectMapper = new ObjectMapper().registerModule(new JavaTimeModule());
		
		String subCate = request.getParameter("subCate");
		vo.setCourseSubCategory(subCate);
		List<CourseVO> courses = dao.courseSelectList(vo);
		String list = objectMapper.writeValueAsString(courses); // list형태의 데이터 => json형태로
		
		response.setContentType("text/json; charset=UTF-8"); // 한글깨짐 방지
		response.getWriter().append(list); //ajax를 return
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
