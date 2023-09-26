package co.four.study.packageBucket.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberVO;
import co.four.study.packageBucket.map.PackageBucketMapper;
import co.four.study.packageBucket.service.PackageBucketService;
import co.four.study.packageBucket.service.PackageBucketVO;

public class PackageBucketServiceImpl implements PackageBucketService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private PackageBucketMapper map = sqlSession.getMapper(PackageBucketMapper.class);
	
	@Override
	public List<PackageBucketVO> pbucketSelectList(PackageBucketVO vo) {
		return map.pbucketSelectList(vo);
	}

	@Override
	public PackageBucketVO pbucketSelect(PackageBucketVO vo) {
		return map.pbucketSelect(vo);
	}

	@Override
	public int pbucketInsert(PackageBucketVO vo) {
		return map.pbucketInsert(vo);
	}

	@Override
	public int pbucketDelete(PackageBucketVO vo) {
		return map.pbucketDelete(vo);
	}

	@Override
	public int pbucketUpdate(PackageBucketVO vo) {
		return map.pbucketUpdate(vo);
	}

	@Override
	public int countBucket(MemberVO vo) {
		return map.countBucket(vo);
	}

	@Override
	public List<PackageBucketVO> memberPackBucketList(PackageBucketVO vo) {
		return map.memberPackBucketList(vo);
	}

	@Override
	public int pbucketDeleteAll(PackageBucketVO vo) {
		return map.pbucketDeleteAll(vo);
	}

}
