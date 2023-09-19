package co.four.study.memberCourse.service;

import java.util.List;

import co.four.study.member.service.MemberVO;

public interface MemberCourseService {
	List<MemberCourseVO> selectMemberCourseList(MemberVO vo);
	MemberCourseVO selectMemberCourse(MemberCourseVO vo);
	int insertMemberCourse(MemberCourseVO vo);
	int deleteMemberCourse(MemberCourseVO vo);
	MemberCourseVO countJindo(MemberCourseVO vo);
	
}
