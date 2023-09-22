package co.four.study.review.map;

import java.util.List;

import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberVO;
import co.four.study.review.service.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> reviewSelectList(ReviewVO vo);
	ReviewVO reviewSelect (ReviewVO vo);
	int reviewInsert(ReviewVO vo);
	int reviewDelete(ReviewVO vo);
	int reviewUpdate(ReviewVO vo);
	
	//회원이 쓴 리뷰수
	int countReview(MemberVO vo);
	//강의별 리뷰목록 가져오기
	List<ReviewVO> courseReviewSortedList(CourseVO vo);
	//강의별 리뷰개수 가져오기
	int courseReviewCount(CourseVO vo);
}
