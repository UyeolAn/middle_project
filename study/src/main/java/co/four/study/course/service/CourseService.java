package co.four.study.course.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import co.four.study.packageCourse.service.PackageCourseVO;
import co.four.study.packages.service.PackageVO;

public interface CourseService {
	List<CourseVO> courseSelectList(CourseVO vo); // 강의 전체조회
	CourseVO courseSelect(CourseVO vo); // 강의 단건조회
	CourseVO courseReviewSelect(CourseVO vo); // 강의 단건조회(리뷰까지)
	int courseInsert(CourseVO vo); // 강의 추가
	int courseUpdate(CourseVO vo); // 강의 수정
	int courseDelete(CourseVO vo); // 강의 삭제
	List<CourseVO> courseSubCategory(CourseVO vo); // 서브카테고리 조회
	List<Map<String, Object>> courseMainCategory(); // 메인카테고리 조회
	
	// 페이징 관련
	int courseTotalCount(CourseVO vo);
	List<CourseVO> coursePagingList(CourseVO vo);
	public String subcateCoursePagingTag(int startPage, int nowPage, int cntPerPage, int endPage, int lastPage, String subCate);
	public String gradeCoursePagingTag(int startPage, int nowPage, int cntPerPage, int endPage, int lastPage, String grade);
	// 강의 페이지 사이드 메뉴 만들기
	public void makeSideMenu(HttpServletRequest request);
	
	//it강의
	List<CourseVO> itcourselist();
	List<CourseVO> itcourseSub(CourseVO vo);
	
	//패키지별 강의 리스트
	List<CourseVO> packageCourseList(PackageCourseVO vo);
	
	//카테고리별 리스트 (해당 패키지에 속하지 않은)
	List<CourseVO> ListNotInPackage(PackageVO vo);
}
