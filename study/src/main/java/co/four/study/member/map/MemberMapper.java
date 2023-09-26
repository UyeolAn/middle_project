package co.four.study.member.map;

import java.util.List;
import java.util.Map;

import co.four.study.member.service.MemberVO;

public interface MemberMapper {

	List<MemberVO> memberSelectList();

	// 멤버 전체 조회
	MemberVO memberSelect(MemberVO vo);

	// ID값 입력>> 검색
	int memberInsert(MemberVO vo);

	int memberUpdate(MemberVO vo);

	int memberDelete(MemberVO vo);
	
	//회원 차단
	int memberBlock(MemberVO vo);
	
	//회원페이지 조회
	MemberVO memberPage(String memberId);
	
	//회원 (관리자 제외) 조회
	List<MemberVO> memberList();
	
	//비밀번호 조회용
	MemberVO memberSearchPass(MemberVO vo);
	//비밀번호 수정
	MemberVO memberPassReset(MemberVO vo);
	
	//직원 리스트
	List<MemberVO> employeeList();
	
	//직원 등록
	int employeeInsert(MemberVO vo);
	
	//월별 이용자수 조회
	List<Map<String, Object>> monthlyClient();
	
	//회원 ID로 권한값 가져오기
	String selectMemberAuthor(String id);
}
			
		