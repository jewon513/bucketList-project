package com.biz.bucket.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BucketVO {

	private long b_id;
	private String b_subject;
	private String 	b_reg_date;
	private String b_update_date;
	private String b_text;
	private int b_complete;
	
}
