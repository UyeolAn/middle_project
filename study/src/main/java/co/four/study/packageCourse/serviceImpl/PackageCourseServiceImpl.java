package co.four.study.packageCourse.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.packageCourse.map.PackageCourseMapper;
import co.four.study.packageCourse.service.PackageCourseService;
import co.four.study.packageCourse.service.PackageCourseVO;

public class PackageCourseServiceImpl implements PackageCourseService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private PackageCourseMapper map = sqlSession.getMapper(PackageCourseMapper.class);

	@Override
	public List<PackageCourseVO> packageCourseSelectList(PackageCourseVO vo) {
		return map.packageCourseSelectList(vo);
	}

	@Override
	public int packageCourseInsert(PackageCourseVO vo) {
		return map.packageCourseInsert(vo);
	}

	@Override
	public int packageCourseDelete(PackageCourseVO vo) {
		return map.packageCourseDelete(vo);
	}

	@Override
	public int priceSumByPackage(PackageCourseVO vo) {
		return map.priceSumByPackage(vo);
	}

}
