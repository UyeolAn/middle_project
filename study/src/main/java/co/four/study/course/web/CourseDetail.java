package co.four.study.course.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;

@WebServlet("/coursedetail.do")
public class CourseDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CourseDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseService dao = new CourseServiceImpl();
		CourseVO vo = new CourseVO();
		String courseId = request.getParameter("courseId");
		System.out.println("받아온 courseId:::: " + courseId);
		
		// 강의 페이지 사이드 메뉴 만들기
		dao.makeSideMenu(request);
		
		// 강의 상세정보 조회
		vo.setCourseId(Integer.parseInt(courseId));
		vo = dao.courseSelect(vo);
		request.setAttribute("course", vo);
		
		System.out.println("상품디테일 서블릿 ::::: 객체정보 === ");
		System.out.println(vo);
		
		// 페이지 포워딩
		String page = "course/courseDetail";
		request.setAttribute("menu", "course");
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
