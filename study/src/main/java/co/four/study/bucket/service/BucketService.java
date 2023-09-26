package co.four.study.bucket.service;

import java.util.List;

import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberVO;

public interface BucketService {
	List<BucketVO> bucketSelectList(BucketVO vo);
	BucketVO bucketSelect(BucketVO vo);
	int bucketInsert(BucketVO vo);
	int bucketDelete(BucketVO vo);
	int bucketUpdate(BucketVO vo);
	
	//회원이 담은 장바구니 갯수
	int countBucket(MemberVO vo);
	//회원의 장바구니 목록
	List<CourseVO> memberBucketList(BucketVO vo);
	//회원이 담은 강의금액의 합
	Integer sumCoursesPrice(BucketVO vo);
	//해당회원의 장바구니 전체삭제(결제했을 경우에 사용)
	int bucketDeleteAll(BucketVO vo);
}
