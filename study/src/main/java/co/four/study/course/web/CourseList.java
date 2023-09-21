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
		
		// 강의 페이지 사이드 메뉴 만들기
		dao.makeSideMenu(request);
		
		// subCate를 누른건지 grade를 누른건지 구분
		try {
			String subCate = request.getParameter("subCate");
			String grade = request.getParameter("grade");
			
			if(!subCate.trim().equals("") && subCate != null) {
				vo.setCourseSubCategory(subCate);
			}
			if(!grade.trim().equals("") && grade != null) {
				vo.setCourseGrade(grade);
			}
		} catch (NullPointerException e) {
			System.out.println("헤더메뉴에서 호출했음!");
		}
		
		
		// 강의 리스트 페이징처리
		int total = dao.courseTotalCount(vo); // 전체건수
		String nowPage = request.getParameter("nowPage"); // 현재페이지
		String cntPerPage = request.getParameter("cntPerPage"); // 보여줄 건수
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		
		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		request.setAttribute("paging", pvo); // 페이징 완료
		
		// 강의 리스트 가져오기
		String cid = request.getParameter("cid"); // 넘어온 메인카테고리
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
			request.setAttribute("courses", courses); // 강의 리스트 조회 완료
			request.setAttribute("tcnt", courses.size()); // 조회된 건수
			request.setAttribute("cid", cid); // 메인카테고리
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
