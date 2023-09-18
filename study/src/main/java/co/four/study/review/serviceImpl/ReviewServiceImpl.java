package co.four.study.review.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.review.map.ReviewMapper;
import co.four.study.review.service.ReviewService;
import co.four.study.review.service.ReviewVO;

public class ReviewServiceImpl implements ReviewService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private ReviewMapper map = sqlSession.getMapper(ReviewMapper.class);
	
	@Override
	public List<ReviewVO> reviewSelectList() {
		return map.reviewSelectList();
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

}
