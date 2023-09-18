package co.four.study.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.member.map.MemberMapper;

public class MemberServiceImpl implements MemberService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class);
	
	@Override
	public List<MemberVO> memberSelectList() {
		return map.memberSelectList();
	}

}
