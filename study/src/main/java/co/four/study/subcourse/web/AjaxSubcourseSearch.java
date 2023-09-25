package co.four.study.subcourse.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.subcourse.service.SubCourseService;
import co.four.study.subcourse.service.SubCourseVO;
import co.four.study.subcourse.serviceImpl.SubCourseServiceImpl;


@WebServlet("/ajaxsubcoursesearch.do")
public class AjaxSubcourseSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxSubcourseSearch() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubCourseVO vo = new SubCourseVO();
		SubCourseService dao = new SubCourseServiceImpl();

		vo.setSubcourseId(Integer.parseInt(request.getParameter("sid")));
		System.out.println(vo);
		vo = dao.subcourseSelect(vo);
		
		System.out.println(vo);
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(vo);
		
		response.setContentType("text/json; charset=utf-8");
		response.getWriter().append(json);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
