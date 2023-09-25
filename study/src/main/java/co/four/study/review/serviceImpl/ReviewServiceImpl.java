package co.four.study.review.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberVO;
import co.four.study.review.map.ReviewMapper;
import co.four.study.review.service.ReviewService;
import co.four.study.review.service.ReviewVO;

public class ReviewServiceImpl implements ReviewService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private ReviewMapper map = sqlSession.getMapper(ReviewMapper.class);
	
	@Override
	public List<ReviewVO> reviewSelectList(ReviewVO vo) {
		return map.reviewSelectList(vo);
	}
	@Override
	public ReviewVO reviewSelect(ReviewVO vo) {
		return map.reviewSelect(vo);
	}
	@Override
	public int reviewInsert(ReviewVO vo) {
		return map.reviewInsert(vo);
	}
	@Override
	public int reviewDelete(ReviewVO vo) {
		return map.reviewDelete(vo);
	}
	@Override
	public int reviewUpdate(ReviewVO vo) {
		return map.reviewUpdate(vo);
	}
	@Override
	public int countReview(MemberVO vo) {
		return map.countReview(vo);
	}
	@Override
	public List<ReviewVO> courseReviewSortedList(CourseVO vo) {
		return map.courseReviewSortedList(vo);
	}
	@Override
	public int courseReviewCount(CourseVO vo) {
		return map.courseReviewCount(vo);
	}
}
