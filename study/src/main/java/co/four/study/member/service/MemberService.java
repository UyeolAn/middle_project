package co.four.study.member.service;

import java.util.List;

public interface MemberService {
	
	//멤버 전체 조회	
	List<MemberVO> memberSelectList();
	//로그인
	MemberVO memberSelect(MemberVO vo);
	//회원가입
	int memberInsert(MemberVO vo);
	//수정
	int memberUpdate(MemberVO vo);
	//회원탈퇴
	int memberDelete(MemberVO vo);
	
	//회원 차단(관리자만)
	int memberBlock(MemberVO vo);
	
	//회원페이지 조회
	MemberVO memberPage(String memberId);
	
	//회원 (관리자 제외) 조회
	List<MemberVO> memberList();
	
	//비밀번호 조회용
	MemberVO memberSearchPass(MemberVO vo);
	
	//비밀번호 리셋
	MemberVO memberPassReset(MemberVO vo);
	
	//직원 리스트
	List<MemberVO> employeeList();
}
