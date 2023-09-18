package co.four.study.member.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.member.map.MemberMapper;
import co.four.study.member.service.MemberCourseVO;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;

public class MemberServiceImpl implements MemberService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class);

	@Override
	public List<MemberVO> memberList() {

		return map.memberList();
	}

	@Override
	public MemberVO memberSearch(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberSearch(vo);
	}

	@Override
	public MemberVO memberAdd(MemberVO vo) {
		return map.memberAdd(vo);
	}

	@Override
	public MemberVO memberModify(MemberVO vo) {
		return map.memberModify(vo);
	}

	@Override
	public MemberVO memberDelete(MemberVO vo) {
		return map.memberDelete(vo);
	}

	@Override
	public List<MemberCourseVO> memberCourse(MemberCourseVO vo) {

		return map.memberCourse(vo);
	}

}
