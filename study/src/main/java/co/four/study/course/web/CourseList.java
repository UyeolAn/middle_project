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


@WebServlet("/courselist.do")
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
		
		// subCategory를 누른건지 grade를 누른건지 구분(상품 디테일 페이지에서 이동할때 사용함)
		String subCate;
		String grade;
		try {
			subCate = request.getParameter("subCate");
			if(!subCate.trim().equals("") && subCate != null) {
				vo.setCourseSubCategory(subCate);
			}
			System.out.println("subCate = " + subCate);
		} catch (NullPointerException e) {
			System.out.println("courseList.do::subCate is null");
		}
		try {
			grade = request.getParameter("grade");
			if(!grade.trim().equals("") && grade != null) {
				vo.setCourseGrade(grade);
			}
			System.out.println("grade = " + grade);
		} catch (NullPointerException e) {
			System.out.println("courseList.do::grade is null");
		}
		
		
		// 강의 리스트 페이징처리
		int total = dao.courseTotalCount(vo); // 전체건수
		String nowPage = request.getParameter("nowPage"); // 현재페이지
		String cntPerPage = request.getParameter("cntPerPage"); // 보여줄 건수
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "9";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "9";
		}
		
		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		request.setAttribute("paging", pvo); // 페이징 완료
		
		// 강의 리스트 가져오기
		String mainCate = request.getParameter("mainCate"); // 넘어온 메인카테고리
		List<CourseVO> courses;

		if(mainCate != null) {
			vo.setCourseMainCategory(mainCate);
			vo.setStart(pvo.getStart());
			vo.setEnd(pvo.getEnd());
			courses = dao.coursePagingList(vo);
		} else {
			vo.setStart(pvo.getStart());
			vo.setEnd(pvo.getEnd());
			courses = dao.coursePagingList(vo);
		}
		
		if(courses.size() > 0) {
			request.setAttribute("courses", courses); // 강의 리스트 조회 완료
			request.setAttribute("tcnt", courses.size()); // 조회된 건수
			request.setAttribute("cid", mainCate); // 메인카테고리
		} else {
			request.setAttribute("result", "empty");
			System.out.println("courselist.do 강의 조회결과 없거나 오류 발생");
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
