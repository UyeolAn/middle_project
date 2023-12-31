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
		String subCate = null;
		String grade = null;
		try {
			subCate = request.getParameter("subCate");
			if(!subCate.trim().equals("") && subCate != null) {
				vo.setCourseSubCategory(subCate);
			}
		} catch (NullPointerException e) {
			System.out.println("courseList.do::subCate is null");
		}
		try {
			grade = request.getParameter("grade");
			if(!grade.trim().equals("") && grade != null) {
				vo.setCourseGrade(grade);
			}
		} catch (NullPointerException e) {
			System.out.println("courseList.do::grade is null");
		}
		
		String mainCate = request.getParameter("mainCate"); // 넘어온 메인카테고리
		if(mainCate != null) {
			vo.setCourseMainCategory(mainCate);
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
		
		//20231004 추가 start
		if(subCate == null && grade == null && mainCate == null) {
			request.setAttribute("paging", pvo); // 전체조회 페이징 완료
		} else {
			String paging = null;
			if(mainCate != null && !mainCate.trim().equals("")) {
				paging = dao.maincateCoursePagingTag(pvo.getStartPage(), pvo.getNowPage(), pvo.getCntPerPage(), pvo.getEndPage(), pvo.getLastPage(), mainCate);
			}
			if(subCate != null && !subCate.trim().equals("")) {
				paging = dao.subcateCoursePagingTag(pvo.getStartPage(), pvo.getNowPage(), pvo.getCntPerPage(), pvo.getEndPage(), pvo.getLastPage(), subCate);
			}
			if(grade != null && !grade.trim().equals("")) {
				paging = dao.gradeCoursePagingTag(pvo.getStartPage(), pvo.getNowPage(), pvo.getCntPerPage(), pvo.getEndPage(), pvo.getLastPage(), grade);
			}
			request.setAttribute("allPaging", "no"); // 전체조회 페이징 여부
			request.setAttribute("pagingTag", paging); // 페이징 태그 넘겨주기
		}
		//20231004 추가 end...
		
		// 강의 리스트 가져오기
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
			request.setAttribute("mainCate", mainCate); // 메인카테고리
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
