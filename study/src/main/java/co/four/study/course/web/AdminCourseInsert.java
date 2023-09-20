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

@WebServlet("/admincourseinsert.do")
public class AdminCourseInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminCourseInsert() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseVO vo = new CourseVO();
		CourseService dao = new CourseServiceImpl();
		
		String courseName = request.getParameter("courseName");
		String courseScript = request.getParameter("courseScript");
		int coursePrice = Integer.parseInt(request.getParameter("coursePrice"));
		String courseTeacher = request.getParameter("courseTeacher");
		String courseMainCategory = request.getParameter("courseMainCategory");
		String courseSubCategory = request.getParameter("courseSubCategory");
		String courseGrade = request.getParameter("courseGrade");
		String courseImg = request.getParameter("courseImg");
		
		vo.setCourseName(courseName);
		vo.setCourseScript(courseScript);
		vo.setCoursePrice(coursePrice);
		vo.setCourseTeacher(courseTeacher);
		vo.setCourseMainCategory(courseMainCategory);
		vo.setCourseSubCategory(courseSubCategory);
		vo.setCourseGrade(courseGrade);
		vo.setCourseImg(courseImg);
		
		int i = dao.courseInsert(vo);
		if(i == 1) {
			request.setAttribute("message", "강의가 등록되었습니다.");
		}
		else {
			request.setAttribute("retCode", "Fail");
		}
//		
//		List<CourseVO> list = dao.courseSelectList(null);
//		
//		String page = "admin/course/courselist";
//		
//		request.setAttribute("courses", list);
//		
//		ViewResolve.foward(request, response, page);
		
		String page = "admin/course/coursePage";
		
		
		request.setAttribute("c", vo);
		ViewResolve.foward(request, response, page);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
