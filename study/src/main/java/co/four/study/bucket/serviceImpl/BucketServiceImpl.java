package co.four.study.bucket.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.bucket.map.BucketMapper;
import co.four.study.bucket.service.BucketService;
import co.four.study.bucket.service.BucketVO;
import co.four.study.common.DataSource;
import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberVO;

public class BucketServiceImpl implements BucketService{

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private BucketMapper map = sqlSession.getMapper(BucketMapper.class);
	
	@Override
	public List<BucketVO> bucketSelectList(BucketVO vo) {
		return map.bucketSelectList(vo);
	}

	@Override
	public BucketVO bucketSelect(BucketVO vo) {
		return map.bucketSelect(vo);
	}

	@Override
	public int bucketInsert(BucketVO vo) {
		return map.bucketInsert(vo);
	}

	@Override
	public int bucketDelete(BucketVO vo) {
		return map.bucketDelete(vo);
	}

	@Override
	public int bucketUpdate(BucketVO vo) {
		return map.bucketUpdate(vo);
	}

	@Override
	public int countBucket(MemberVO vo) {
		return map.countBucket(vo);
	}

	@Override
	public List<CourseVO> memberBucketList(BucketVO vo) {
		return map.memberBucketList(vo);
	}

	@Override
	public Integer sumCoursesPrice(BucketVO vo) {
		return map.sumCoursesPrice(vo);
	}

	@Override
	public int bucketDeleteAll(BucketVO vo) {
		return map.bucketDeleteAll(vo);
	}

}
