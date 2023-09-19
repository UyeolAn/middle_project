package co.four.study.member.service;

import java.util.List;

public interface MemberService {
	
	List<MemberVO> memberSelectList();
	//멤버 전체 조회
	MemberVO memberSelect(MemberVO vo);
	//ID값 입력>> 검색
	int memberInsert(MemberVO vo);
	
	int memberUpdate(MemberVO vo);
	
	int memberDelete(MemberVO vo);
	
	//회원 차단
	int memberBlock(MemberVO vo);
	
	//회원페이지 조회
	MemberVO memberPage(String memberId);
	
	//회원 (관리자 제외) 조회
	List<MemberVO> memberList();
	
}
