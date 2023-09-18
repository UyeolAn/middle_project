package co.four.study.member.service;

import java.util.List;

public interface MemberService {

	
	List<MemberVO> memberList();
	//멤버 전체 조회
	MemberVO memberSearch(MemberVO vo);
	//ID값 입력>> 검색
	MemberVO memberAdd(MemberVO vo);
	
	MemberVO memberModify(MemberVO vo);
	
	MemberVO memberDelete(MemberVO vo);
	
	List<MemberCourseVO> memberCourse(MemberCourseVO vo);
	//수강중인 목록 조회
	
	
	
}
