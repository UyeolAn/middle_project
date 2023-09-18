package co.four.study.member;

import java.util.List;

import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberServiceImpl;
import co.four.study.member.service.MemberVO;

public class Test {
	public static void main(String[] args) {
		MemberService dao = new MemberServiceImpl();
		List<MemberVO> list = dao.memberSelectList();
		for (MemberVO member : list) {
			System.out.println(member);
		}
	}
}
