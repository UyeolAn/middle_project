package co.four.study.course.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.course.map.CourseMapper;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;

public class CourseServiceImpl implements CourseService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private CourseMapper map = sqlSession.getMapper(CourseMapper.class);

	@Override
	public List<CourseVO> courseSelectList() {
		return map.courseSelectList();
	}

	@Override
	public CourseVO courseSelect(CourseVO vo) {
		return map.courseSelect(vo);
	}

	@Override
	public int courseInsert(CourseVO vo) {
		return map.courseInsert(vo);
	}

	@Override
	public int courseUpdate(CourseVO vo) {
		return map.courseUpdate(vo);
	}

	@Override
	public int courseDelete(CourseVO vo) {
		return map.courseDelete(vo);
	}

}
