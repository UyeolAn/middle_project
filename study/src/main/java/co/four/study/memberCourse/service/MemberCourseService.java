package co.four.study.memberCourse.service;

import java.util.List;

import co.four.study.member.service.MemberVO;

public interface MemberCourseService {
	List<MemberCourseVO> selectMemberCourseList(MemberVO vo);
	MemberCourseVO selectMemberCourse(MemberCourseVO vo);
	int insertMemberCourse(MemberCourseVO vo);
	int deleteMemberCourse(MemberCourseVO vo);
	
	//진도율
	MemberCourseVO countJindo(MemberCourseVO vo);
	
	//회원이 수강하는 카테고리
	List<String> category(MemberVO vo);
	
	//회원이 수강하는 강의 가격 합
	int priceSum(MemberVO vo);
	
}
