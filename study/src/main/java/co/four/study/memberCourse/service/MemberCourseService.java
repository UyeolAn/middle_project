package co.four.study.memberCourse.service;

import java.util.List;

public interface MemberCourseService {
	List<MemberCourseVO> selectMemberCourseList();
	MemberCourseVO selectMemberCourse(MemberCourseVO vo);
	int insertMemberCourse(MemberCourseVO vo);
	int deleteMemberCourse(MemberCourseVO vo);
}
