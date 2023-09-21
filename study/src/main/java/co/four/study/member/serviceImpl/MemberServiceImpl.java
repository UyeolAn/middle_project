package co.four.study.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.member.map.MemberMapper;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;

public class MemberServiceImpl implements MemberService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class);


	@Override
	public List<MemberVO> memberSelectList() {

		return map.memberSelectList();
	}

	@Override
	public MemberVO memberSelect(MemberVO vo) {

		return map.memberSelect(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {

		return map.memberInsert(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {

		return map.memberUpdate(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		return map.memberDelete(vo);
	}

	@Override
	public int memberBlock(MemberVO vo) {
		return map.memberBlock(vo);
	}

	@Override
	public MemberVO memberPage(String memberId) {
		return map.memberPage(memberId);
	}

	@Override
	public List<MemberVO> memberList() {
		return map.memberList();
	}

	@Override
	public int memberSearchPass(MemberVO vo) {
		
		return map.memberSearchPass(vo);
	}

}
