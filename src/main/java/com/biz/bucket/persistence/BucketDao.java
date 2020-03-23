package com.biz.bucket.persistence;

import java.util.List;

import com.biz.bucket.domain.BucketVO;

public interface BucketDao {

	public void completeUpdate(BucketVO bucketVO);
	public void update(BucketVO bucketVO);
	public void insert(BucketVO bucketVO);
	public void delete(long b_id);
	
	public List<BucketVO> selectAll ();
	public BucketVO findById(long b_id);
	

}
