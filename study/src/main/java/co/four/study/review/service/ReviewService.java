package co.four.study.review.service;

import java.util.List;

import co.four.study.member.service.MemberVO;

public interface ReviewService {
	List<ReviewVO> reviewSelectList();
	ReviewVO reviewSelect (ReviewVO vo);
	int reviewInsert(ReviewVO vo);
	int reviewDelete(ReviewVO vo);
	int reviewUpdate(ReviewVO vo);
	
	//회원이 쓴 리뷰수
	int countReview(MemberVO vo);
	
	//강의별 평점
	List<ReviewVO> reviewStars();
}
