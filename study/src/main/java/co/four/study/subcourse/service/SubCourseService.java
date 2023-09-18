package co.four.study.subcourse.service;

import java.util.List;

public interface SubCourseService {
	List<SubCourseVO> subcourseSelectList(); // 서브강의 전체조회
	SubCourseVO subcourseSelect(SubCourseVO vo); // 서브강의 한건조회
	int subcourseInsert(SubCourseVO vo); // 서브강의 추가
	int subcourseUpdate(SubCourseVO vo); // 서브강의 수정
	int subcourseDelete(SubCourseVO vo); // 서브강의 삭제
}
