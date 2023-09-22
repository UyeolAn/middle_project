package co.four.study.subcourse.service;

import java.util.List;

import co.four.study.course.service.CourseVO;

public interface SubCourseService {
	List<SubCourseVO> subcourseSelectList(); // 서브강의 전체조회
	SubCourseVO subcourseSelect(SubCourseVO vo); // 서브강의 한건조회
	int subcourseInsert(SubCourseVO vo); // 서브강의 추가
	int subcourseUpdate(SubCourseVO vo); // 서브강의 수정
	int subcourseDelete(SubCourseVO vo); // 서브강의 삭제
	
	//메인강의로 서브강의들 찾는 함수
	List<SubCourseVO> subcourseByCourse(CourseVO vo);
	//정렬된 서브강의 목록
	List<SubCourseVO> subcourseSortedList(CourseVO vo);
}
