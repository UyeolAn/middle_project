package co.four.study.course.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;
import co.four.study.subcourse.service.SubCourseService;
import co.four.study.subcourse.service.SubCourseVO;
import co.four.study.subcourse.serviceImpl.SubCourseServiceImpl;


@WebServlet("/admincoursepage.do")
public class AdminCoursePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminCoursePage() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseVO vo = new CourseVO();
		CourseService dao = new CourseServiceImpl();
		
		SubCourseService sdao = new SubCourseServiceImpl();

		
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		vo.setCourseId(cid);
		vo = dao.courseSelect(vo);
		vo.setCourseMainCategory(vo.getCourseMainCategory().toUpperCase());
		vo.setCourseSubCategory(vo.getCourseSubCategory().toUpperCase());
		
		List<SubCourseVO> slist = sdao.subcourseByCourse(vo);
		
		for(int i=0; i<slist.size(); i++) {
			slist.get(i).setSubcourseTime((slist.get(i).getSubcourseTime())/60);
		}
		
		String page = "admin/course/coursePage";
		
		System.out.println(cid);
		
		request.setAttribute("c", vo);
		request.setAttribute("subcourse", slist);
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
