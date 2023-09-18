package co.four.study.member.map;

import java.util.List;

import co.four.study.member.service.MemberCourseVO;
import co.four.study.member.service.MemberVO;

public interface MemberMapper {

	List<MemberVO> memberSelectList();

	MemberVO memberSearch(MemberVO vo);

	MemberVO memberAdd(MemberVO vo);

	MemberVO memberModify(MemberVO vo);

	MemberVO memberDelete(MemberVO vo);
	
	List<MemberCourseVO> memberCourse(MemberCourseVO vo);
}
