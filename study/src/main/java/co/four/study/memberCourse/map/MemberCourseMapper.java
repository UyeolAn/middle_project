package co.four.study.memberCourse.map;

import java.util.List;

import co.four.study.member.service.MemberVO;
import co.four.study.memberCourse.service.MemberCourseVO;

public interface MemberCourseMapper {
	List<MemberCourseVO> selectMemberCourseList(MemberVO vo);
	MemberCourseVO selectMemberCourse(MemberCourseVO vo);
	int insertMemberCourse(MemberCourseVO vo);
	int deleteMemberCourse(MemberCourseVO vo);
	MemberCourseVO countJindo(MemberCourseVO vo);
	
}
