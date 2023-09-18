package co.four.study.bucket.service;

import java.util.List;

public interface BucketService {
	List<BucketVO> bucketSelectList();
	BucketVO bucketSelect(BucketVO vo);
	int bucketInsert(BucketVO vo);
	int bucketDelete(BucketVO vo);
	int bucketUpdate(BucketVO vo);
}
