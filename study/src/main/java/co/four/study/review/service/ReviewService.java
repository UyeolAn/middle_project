package co.four.study.review.service;

import java.util.List;

public interface ReviewService {
	List<ReviewVO> reviewSelectList();
	ReviewVO reviewSelect (ReviewVO vo);
	int reviewInsert(ReviewVO vo);
	int reviewDelete(ReviewVO vo);
	int reviewUpdate(ReviewVO vo);
}
