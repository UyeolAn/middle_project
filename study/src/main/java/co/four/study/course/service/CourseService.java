package co.four.study.course.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CourseService {
	List<CourseVO> courseSelectList(CourseVO vo); // 강의 전체조회
	CourseVO courseSelect(CourseVO vo); // 강의 단건조회
	int courseInsert(CourseVO vo); // 강의 추가
	int courseUpdate(CourseVO vo); // 강의 수정
	int courseDelete(CourseVO vo); // 강의 삭제
	List<CourseVO> courseSubCategory(CourseVO vo); // 서브카테고리 조회
	List<Map<String, Object>> courseMainCategory(); // 메인카테고리 조회
	
	// 페이징 관련
	int courseTotalCount(CourseVO vo);
	List<CourseVO> coursePagingList(CourseVO vo);
	public String makeSubCateCourseList(int startPage, int nowPage, int cntPerPage, int endPage, int lastPage, String subCate);
	public String makeGradeCourseList(int startPage, int nowPage, int cntPerPage, int endPage, int lastPage, String grade);
	// 강의 페이지 사이드 메뉴 만들기
	public void makeSideMenu(HttpServletRequest request);
	
	CourseVO courseReviewSelect(CourseVO vo);
}
