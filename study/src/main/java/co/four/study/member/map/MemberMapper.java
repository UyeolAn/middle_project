package co.four.study.member.map;

import java.util.List;

import co.four.study.member.service.MemberCourseVO;
import co.four.study.member.service.MemberVO;

public interface MemberMapper {

	List<MemberVO> memberSelectList();

	// 멤버 전체 조회
	MemberVO memberSelect(MemberVO vo);

	// ID값 입력>> 검색
	int memberInsert(MemberVO vo);

	int memberUpdate(MemberVO vo);

	int memberDelete(MemberVO vo);

	List<MemberCourseVO> memberCourse(MemberCourseVO vo);
	// 수강중인 목록 조회
}
