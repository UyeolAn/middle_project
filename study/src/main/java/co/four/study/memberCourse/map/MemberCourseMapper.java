package co.four.study.memberCourse.map;

import java.util.List;

import co.four.study.memberCourse.service.MemberCourseVO;

public interface MemberCourseMapper {
	List<MemberCourseVO> selectMemberCourseList();
	MemberCourseVO selectMemberCourse(MemberCourseVO vo);
	int insertMemberCourse(MemberCourseVO vo);
	int deleteMemberCourse(MemberCourseVO vo);
}
