package co.four.study.course.map;

import java.util.List;

import co.four.study.course.service.CourseVO;

public interface CourseMapper {
	List<CourseVO> courseSelectList(); // 강의 전체조회
	CourseVO courseSelect(CourseVO vo); // 강의 단건조회
	int courseInsert(CourseVO vo); // 강의 추가
	int courseUpdate(CourseVO vo); // 강의 수정
	int courseDelete(CourseVO vo); // 강의 삭제
	List<CourseVO> courseMenuList(CourseVO vo); // 강의 메뉴조회
}
