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


@WebServlet("/courseall.do")
public class CourseAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CourseAll() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// course 페이지 메뉴 구성하기
		CourseService dao = new CourseServiceImpl();
		CourseVO vo = new CourseVO();
		
		vo.setCourseMainCategory("IT"); // IT 관련 서브카테고리 가져오기
		List<CourseVO> it = dao.courseMenuList(vo);
		request.setAttribute("it", it);
		
		// 페이지 포워딩
		String page = "course/courseAll";
		request.setAttribute("menu", "course");
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
