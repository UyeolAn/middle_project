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

@WebServlet("/coursedetail.do")
public class CourseDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CourseDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseService dao = new CourseServiceImpl();
		SubCourseService sdao = new SubCourseServiceImpl();
		CourseVO vo = new CourseVO();
		int courseId = Integer.valueOf(request.getParameter("courseId"));
		
		// 강의 상세정보 조회
		vo.setCourseId(courseId);
		vo = dao.courseReviewSelect(vo);
		request.setAttribute("course", vo);
		// 미리보기 강의 1건 조회
		SubCourseVO svo = new SubCourseVO();
		svo.setCourseId(courseId);
		svo.setSubcourseId(1);
		svo = sdao.subcourseSelect(svo);
		request.setAttribute("free", svo);
		
		// 서브강의 리스트 조회
		vo = new CourseVO();
		vo.setCourseId(courseId);
		List<SubCourseVO> subCourses = sdao.subcourseSortedList(vo);
		
		// 강의 시간 계산
		for(int i=0; i<subCourses.size(); i++) {
			subCourses.get(i).setSubcourseTime((subCourses.get(i).getSubcourseTime())/60);
		}
		request.setAttribute("subCourses", subCourses);
		System.out.println(subCourses);
		
		// 강의 페이지 사이드 메뉴 만들기
		dao.makeSideMenu(request);
		// 페이지 포워딩
		String page = "course/courseDetail";
		request.setAttribute("menu", "course");
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
