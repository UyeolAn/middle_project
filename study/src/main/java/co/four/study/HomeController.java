package co.four.study;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/home.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseService dao = new CourseServiceImpl();
		
		//인기많은 강의
		List<CourseVO> hotList = dao.hotCourseList();
		for(CourseVO vo : hotList) {
			vo = dao.courseReviewSelect(vo);
		}
		//리뷰많은 강의
		List<CourseVO> reviewList = dao.reviewCourseList();
		for(CourseVO vo : reviewList) {
			vo = dao.courseReviewSelect(vo);
		}
		//랜덤 it강의
		List<CourseVO> itList = dao.itRandomCourseList();
		for(CourseVO vo : itList) {
			vo = dao.courseReviewSelect(vo);
			System.out.println(vo);
		}
//		List<CourseVO> courseList = new ArrayList<>();
//		System.out.println(itList);
//		for(int i = 0; i < 4; i++) {
//			courseList.add(hotList.get(i));
//			courseList.add(reviewList.get(i));
//			courseList.add(itList.get(i));
//		}
		
		request.setAttribute("hotList", hotList);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("itList", itList);
		String page = "home/home.jsp";
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
