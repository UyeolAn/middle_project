package co.four.study.subcourse.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.course.service.CourseVO;
import co.four.study.subcourse.map.SubCourseMapper;
import co.four.study.subcourse.service.SubCourseService;
import co.four.study.subcourse.service.SubCourseVO;

public class SubCourseServiceImpl implements SubCourseService{
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private SubCourseMapper map = sqlSession.getMapper(SubCourseMapper.class);

	@Override
	public List<SubCourseVO> subcourseSelectList() {
		return map.subcourseSelectList();
	}

	@Override
	public SubCourseVO subcourseSelect(SubCourseVO vo) {
		return map.subcourseSelect(vo);
	}

	@Override
	public int subcourseInsert(SubCourseVO vo) {
		return map.subcourseInsert(vo);
	}

	@Override
	public int subcourseUpdate(SubCourseVO vo) {
		return map.subcourseUpdate(vo);
	}

	@Override
	public int subcourseDelete(SubCourseVO vo) {
		return map.subcourseDelete(vo);
	}

	@Override
	public List<SubCourseVO> subcourseByCourse(CourseVO vo) {
		return map.subcourseByCourse(vo);
	}

	@Override
	public List<SubCourseVO> subcourseSortedList(CourseVO vo) {
		return map.subcourseSortedList(vo);
	}

}
