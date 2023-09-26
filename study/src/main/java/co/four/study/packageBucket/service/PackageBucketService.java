package co.four.study.packageBucket.service;

import java.util.List;

import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberVO;

public interface PackageBucketService {
	List<PackageBucketVO> pbucketSelectList(PackageBucketVO vo);
	PackageBucketVO pbucketSelect(PackageBucketVO vo);
	int pbucketInsert(PackageBucketVO vo);
	int pbucketDelete(PackageBucketVO vo);
	int pbucketUpdate(PackageBucketVO vo);
	
	//회원이 담은 장바구니 갯수
	int countBucket(MemberVO vo);
	//회원의 장바구니 목록
	List<PackageBucketVO> memberPackBucketList(PackageBucketVO vo);
	//해당회원의 장바구니 전체삭제(결제했을 경우에 사용)
	int pbucketDeleteAll(PackageBucketVO vo);
}
