package com.biz.bucket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.bucket.domain.BucketVO;
import com.biz.bucket.persistence.BucketDao;


@Service
public class BucketService {

	@Autowired
	BucketDao bucketDao;
	
	public List<BucketVO> getList(){
		
		List<BucketVO> list = bucketDao.selectAll();
		
		list.forEach(vo -> vo.setB_text(vo.getB_text().replaceAll("\r\n", "<br>")));
		
		
		return list; 
	}
	
	public void insert(BucketVO bucketVO) {
		// TODO Auto-generated method stub
	
		bucketDao.insert(bucketVO);
	}
	
	public void update(BucketVO bucketVO) {
		
		bucketDao.update(bucketVO);
		
	}

	public void completeUpdate(String b_id) {
		// TODO Auto-generated method stub
		
		BucketVO bucketVO = bucketDao.findById(Long.valueOf(b_id));
		
		if(bucketVO.getB_complete() == 0) {
			bucketVO.setB_complete(1);
		}else {
			bucketVO.setB_complete(0);
		}
		
		bucketDao.completeUpdate(bucketVO);
		
	}

	public void delete(String b_id) {
		// TODO Auto-generated method stub
		
		bucketDao.delete(Long.valueOf(b_id));
		
	}

	
	
	
}
