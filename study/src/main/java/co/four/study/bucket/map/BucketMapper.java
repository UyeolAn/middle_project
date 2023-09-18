package co.four.study.bucket.map;

import java.util.List;

import co.four.study.bucket.service.BucketVO;

public interface BucketMapper {
	List<BucketVO> bucketSelectList();
	BucketVO bucketSelect(BucketVO vo);
	int bucketInsert(BucketVO vo);
	int bucketDelete(BucketVO vo);
	int bucketUpdate(BucketVO vo);
}
