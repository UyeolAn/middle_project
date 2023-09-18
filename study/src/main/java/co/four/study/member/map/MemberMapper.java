package co.four.study.member.map;

import java.util.List;

import co.four.study.member.service.MemberVO;

public interface MemberMapper {
	
	List<MemberVO> memberSelectList(); // 회원 전체 조회
	
}
