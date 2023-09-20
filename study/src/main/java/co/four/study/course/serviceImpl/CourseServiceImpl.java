package co.four.study.course.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.course.map.CourseMapper;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.service.PagingVO;

public class CourseServiceImpl implements CourseService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private CourseMapper map = sqlSession.getMapper(CourseMapper.class);

	@Override
	public List<CourseVO> courseSelectList(CourseVO vo) {
		return map.courseSelectList(vo);
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

	@Override
	public List<CourseVO> courseSubCategory(CourseVO vo) {
		return map.courseSubCategory(vo);
	}

	@Override
	public List<Map<String, Object>> courseMainCategory() {
		return map.courseMainCategory();
	}

	@Override
	public int courseTotalCount() {
		return map.courseTotalCount();
	}

	@Override
	public List<CourseVO> coursePagingList(CourseVO vo) {
		return map.coursePagingList(vo);
	}


}
