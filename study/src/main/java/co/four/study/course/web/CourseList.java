package co.four.study.course.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;


@WebServlet("/courseList.do")
public class CourseList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CourseList() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// course 페이지 메뉴 구성하기
		CourseService dao = new CourseServiceImpl();
		CourseVO vo = new CourseVO();
		List<CourseVO> subCategory;
		
		// IT 관련 서브카테고리 가져오기
		vo.setCourseMainCategory("it");
		subCategory = dao.courseSubCategory(vo);
		request.setAttribute("it", subCategory);
		
		// 영어 관련 서브카테고리 가져오기
		vo.setCourseMainCategory("english");
		subCategory = dao.courseSubCategory(vo);
		request.setAttribute("english", subCategory);
		
		// 초기화면 전체리스트 가져오기
		List<CourseVO> courses = dao.courseSelectList(null);
		
		if(courses != null) {
			request.setAttribute("courses", courses);
			request.setAttribute("tcnt", courses.size());
		} else {
			System.out.println("강의 조회에서 오류 발생");
		}
		
		// 페이지 포워딩
		String page = "course/courseList";
		request.setAttribute("menu", "course");
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
