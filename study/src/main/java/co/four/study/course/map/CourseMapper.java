package co.four.study.course.map;

import java.util.List;
import java.util.Map;

import co.four.study.course.service.CourseVO;
import co.four.study.packageCourse.service.PackageCourseVO;
import co.four.study.packages.service.PackageVO;

public interface CourseMapper {
	List<CourseVO> courseSelectList(CourseVO vo); // 강의 전체조회, 메인카테고리별 조회
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
	
	//it강의
	List<CourseVO> itcourselist();
	List<CourseVO> itcourseSub(CourseVO vo);
	
	//패키지별 강의 리스트
	List<CourseVO> packageCourseList(PackageCourseVO vo);
	
	//카테고리별 리스트 (해당 패키지에 속하지 않은)
	List<CourseVO> ListNotInPackage(PackageVO vo);
}
