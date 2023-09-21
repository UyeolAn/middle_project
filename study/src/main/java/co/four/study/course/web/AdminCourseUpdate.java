package co.four.study.course.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;


@WebServlet("/admincourseupdate.do")
public class AdminCourseUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminCourseUpdate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseVO vo = new CourseVO(); 
		vo.setCourseId(Integer.parseInt(request.getParameter("courseID")));
		CourseService dao = new CourseServiceImpl();
		
		vo = dao.courseSelect(vo);
		
		System.out.println(vo);
		
		doGet(request, response);
	}

}
