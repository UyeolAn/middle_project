package co.four.study.course.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.service.PagingVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;

@WebServlet("/ajaxCourseList.do")
public class AjaxCourseList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxCourseList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseService dao = new CourseServiceImpl();
		CourseVO vo = new CourseVO();
		ObjectMapper objectMapper = new ObjectMapper().registerModule(new JavaTimeModule());
		
		// subCate를 누른건지 grade를 누른건지 구분
		String paging = null;
		String subCate = request.getParameter("subCate");
		String grade = request.getParameter("grade");
		
		if(!subCate.trim().equals("") && subCate != null) {
			vo.setCourseSubCategory(subCate);
		}
		if(!grade.trim().equals("") && grade != null) {
			vo.setCourseGrade(grade);
		}
		
		// 강의 리스트 페이징처리 및 데이터 가져오기
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
		
		if(!subCate.trim().equals("") && subCate != null) {
			paging = dao.subcateCoursePagingTag(pvo.getStartPage(), pvo.getNowPage(), pvo.getCntPerPage(), pvo.getEndPage(), pvo.getLastPage(), subCate);
		}
		if(!grade.trim().equals("") && grade != null) {
			paging = dao.gradeCoursePagingTag(pvo.getStartPage(), pvo.getNowPage(), pvo.getCntPerPage(), pvo.getEndPage(), pvo.getLastPage(), grade);
		}
		
		Map<String, String> pmap = new HashMap<String,String>();
		pmap.put("paging", paging);
		
		// 넘어온 서브카테고리로 데이터 조회
		vo.setStart(pvo.getStart());
		vo.setEnd(pvo.getEnd());
		List<CourseVO> courses = dao.coursePagingList(vo);
		
		List<Object> volist = new ArrayList<>();
		volist.add(pmap);
		volist.add(courses);
		String list = objectMapper.writeValueAsString(volist); // list형태의 데이터 => json형태로
		
		response.setContentType("text/json; charset=UTF-8"); // 한글깨짐 방지
		response.getWriter().append(list); //ajax를 return
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
