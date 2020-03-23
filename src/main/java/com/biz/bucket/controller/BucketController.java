package com.biz.bucket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.bucket.domain.BucketVO;
import com.biz.bucket.service.BucketService;

import lombok.extern.slf4j.Slf4j;

@Slf4j

@Controller
public class BucketController {
	
	@Autowired
	BucketService bucketService;

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model) {
		
		List<BucketVO> list = bucketService.getList();
		
		model.addAttribute("LIST", list);
		
		return "main";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(BucketVO bucketVO) {
		
		log.debug("컨트롤러 INSERT 받은 값 : " + bucketVO.toString());
		
		bucketService.insert(bucketVO);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(String b_id) {
		
		log.debug("컨트롤러 DELETE 받은 값 : " + b_id);
		
		bucketService.delete(b_id);
		
		return "redirect:/main";
	}
	
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(BucketVO bucketVO) {
		
		log.debug("컨트롤러 UPDATE 받은 값 : " + bucketVO.toString());
		
		bucketService.update(bucketVO);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value = "completeUpdate", method = RequestMethod.POST)
	public String update(String b_id) {
		
		log.debug("컨트롤러 completeUpdate 받은 값 : " + b_id);
		
		bucketService.completeUpdate(b_id);
		
		return "redirect:/main";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
