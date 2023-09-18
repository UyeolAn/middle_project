package co.four.study.review.map;

import java.util.List;

import co.four.study.review.service.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> reviewSelectList();
	ReviewVO reviewSelect (ReviewVO vo);
	int reviewInsert(ReviewVO vo);
	int reviewDelete(ReviewVO vo);
	int reviewUpdate(ReviewVO vo);
}