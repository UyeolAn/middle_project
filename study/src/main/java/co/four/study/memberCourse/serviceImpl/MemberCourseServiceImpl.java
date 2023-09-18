package co.four.study.memberCourse.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.memberCourse.map.MemberCourseMapper;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;

public class MemberCourseServiceImpl implements MemberCourseService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MemberCourseMapper map = sqlSession.getMapper(MemberCourseMapper.class);

	@Override
	public List<MemberCourseVO> selectMemberCourseList() {
		return map.selectMemberCourseList();
	}

	@Override
	public MemberCourseVO selectMemberCourse(MemberCourseVO vo) {
		return map.selectMemberCourse(vo);
	}

	@Override
	public int insertMemberCourse(MemberCourseVO vo) {
		return map.insertMemberCourse(vo);
	}

	@Override
	public int deleteMemberCourse(MemberCourseVO vo) {
		return map.deleteMemberCourse(vo);
	}

}