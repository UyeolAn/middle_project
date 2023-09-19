package co.four.study.bucket.map;

import java.util.List;

import co.four.study.bucket.service.BucketVO;
import co.four.study.member.service.MemberVO;

public interface BucketMapper {
	List<BucketVO> bucketSelectList();
	BucketVO bucketSelect(BucketVO vo);
	int bucketInsert(BucketVO vo);
	int bucketDelete(BucketVO vo);
	int bucketUpdate(BucketVO vo);
	
	//회원이 담은 장바구니 갯수
	int countBucket(MemberVO vo);
}
