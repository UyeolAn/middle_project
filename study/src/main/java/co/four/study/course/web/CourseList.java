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


@WebServlet("/courseList.do")
public class CourseList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CourseList() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseService dao = new CourseServiceImpl();
		CourseVO vo = new CourseVO();
		List<CourseVO> subCategory;
		
		// 강의 페이지 사이드 메뉴 만들기
		// it 관련
		vo.setCourseMainCategory("it"); 
		subCategory = dao.courseSubCategory(vo);
		request.setAttribute("it", subCategory);
		// english 관련
		vo.setCourseMainCategory("english"); 
		subCategory = dao.courseSubCategory(vo);
		request.setAttribute("english", subCategory);
		
		// 강의 리스트 페이징처리 및 데이터 가져오기
		int total = dao.courseTotalCount(); // 전체건수
		String nowPage = request.getParameter("nowPage"); // 현재페이지
		String cntPerPage = request.getParameter("cntPerPage"); // 보여줄 건수
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "2";
			cntPerPage = "5";
		} else if(nowPage == null) {
			nowPage = "2";
		} else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		
		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(pvo);
		request.setAttribute("paging", pvo); // 페이징 완료
		
		String cid = request.getParameter("cid"); // 넘어온 메인카테고리(DB조회시 사용)
		List<CourseVO> courses;

		vo = new CourseVO();
		if(cid != null) {
			vo.setCourseMainCategory(cid);
			vo.setStart(pvo.getStart());
			vo.setEnd(pvo.getEnd());
			courses = dao.coursePagingList(vo);
		} else {
			vo.setStart(pvo.getStart());
			vo.setEnd(pvo.getEnd());
			courses = dao.coursePagingList(vo);
		}
		
		if(courses != null) {
			request.setAttribute("courses", courses);
			request.setAttribute("tcnt", courses.size());
			request.setAttribute("cid", cid);
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
