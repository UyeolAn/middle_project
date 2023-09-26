package co.four.study.memberCourse.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberVO;
import co.four.study.memberCourse.map.MemberCourseMapper;
import co.four.study.memberCourse.service.MemberCourseQnaVO;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;

public class MemberCourseServiceImpl implements MemberCourseService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MemberCourseMapper map = sqlSession.getMapper(MemberCourseMapper.class);

	@Override
	public List<MemberCourseVO> selectMemberCourseList(MemberVO vo) {
		return map.selectMemberCourseList(vo);
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

	@Override
	public MemberCourseVO countJindo(MemberCourseVO vo) {
		return map.countJindo(vo);
	}

	@Override
	public List<String> category(MemberVO vo) {
		return map.category(vo);
	}

	@Override
	public int priceSum(MemberVO vo) {
		return map.priceSum(vo);
	}

	@Override
	public int courseStudent(CourseVO vo) {
		return map.courseStudent(vo);
	}


	@Override
	public List<String> distinctStudentCategory(MemberCourseVO vo) {
		return map.distinctStudentCategory(vo);
	}

	@Override
	public int countStudentCategory(MemberCourseVO vo) {
		return map.countStudentCategory(vo);
	}

	@Override
	public int totalPrice() {
		return map.totalPrice();
	}

	@Override
	public int memberCourseStatus(MemberCourseVO vo) {
		return map.memberCourseStatus(vo);
	}

	@Override
	public List<MemberCourseVO> selectMemberCourseListDetail(MemberVO vo){
		return map.selectMemberCourseListDetail(vo);
  }
  
  @Override
	public List<MemberCourseQnaVO> selectMemberCourseWithName(String id) {
		return map.selectMemberCourseWithName(id);
  }
   
  @Override
	public int distributionSubcategory(CourseVO vo) {
		return map.distributionSubcategory(vo);
	}

	@Override
	public int memberCourseCount(MemberCourseVO vo) {
		return map.memberCourseCount(vo);
	}

}
