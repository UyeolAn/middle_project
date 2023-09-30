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
import co.four.study.course.service.PagingVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;

@WebServlet("/coursesearch.do")
public class CourseSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CourseSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseService dao = new CourseServiceImpl();
		CourseVO vo = new CourseVO();
		String courseName = request.getParameter("courseName"); //검색키워드
		vo.setCourseName(courseName);
		
		// 강의 페이지 사이드 메뉴 만들기
		dao.makeSideMenu(request);
		
		// 강의 리스트 페이징처리
		int total = dao.courseTotalCount(vo); // 전체건수
		
		PagingVO pvo = new PagingVO(total, 1, 9);
		request.setAttribute("paging", pvo); // 페이징 완료
		
		vo.setStart(pvo.getStart());
		vo.setEnd(pvo.getEnd());
		List<CourseVO> courses = dao.coursePagingList(vo);
		
		if(courses.size() > 0) {
			request.setAttribute("courses", courses); // 강의 리스트 조회 완료
		} else {
			request.setAttribute("result", "empty");
			System.out.println("coursesearch.do 강의키워드 조회결과 없거나 오류 발생");
		}
		
		// 페이지 포워딩
		String page = "course/courseList";
		request.setAttribute("menu", "course");
		ViewResolve.foward(request, response, page);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
