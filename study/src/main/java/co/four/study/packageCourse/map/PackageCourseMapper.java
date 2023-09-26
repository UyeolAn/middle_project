package co.four.study.packageCourse.map;

import java.util.List;

import co.four.study.packageCourse.service.PackageCourseVO;

public interface PackageCourseMapper {

	List<PackageCourseVO> packageCourseSelectList(PackageCourseVO vo); //패키지아이디별 리스트(등록된 강의 가져오기)
	int packageCourseInsert(PackageCourseVO vo); //패키지별 강의 등록하기
	int packageCourseDelete(PackageCourseVO vo); //패키지별 등록된 특정 강의 삭제하기

}
