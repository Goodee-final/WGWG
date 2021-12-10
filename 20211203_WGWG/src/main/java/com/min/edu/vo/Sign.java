package com.min.edu.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Sign {

	private int emp_no;	//사원번호
	private String sign_reg_dt;	//등록일
	private String sign_exp_dt;	//만료일
	private String sign_img;	//이미지 경로
	private String sign_img_size;	//이미지 크기
}
