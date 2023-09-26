package co.four.study.packageCourse.service;

import java.util.List;

public interface PackageCourseService {
	// 패키지에 등록된 강의아이디(course_id)는 수정하기보다 삭제 후 생성하는게 좋을 듯함.
	List<PackageCourseVO> packageCourseSelectList(PackageCourseVO vo); //패키지아이디별 리스트(등록된 강의 가져오기)
	int packageCourseInsert(PackageCourseVO vo); //패키지별 강의 등록하기
	int packageCourseDelete(PackageCourseVO vo); //패키지별 등록된 특정 강의 삭제하기
}
