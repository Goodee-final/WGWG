package com.min.edu.vo.sign;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Sign {

	private int sign_no; //전자서명 번호
	private int emp_no;	//사원번호
	private String sign_reg_dt;	//등록일
	private String sign_exp_dt;	//만료일
	private String sign_img;	//이미지 경로
	private String sign_img_size;	//이미지 크기

	public Sign(int emp_no, String sign_img, String sign_img_size) {
		super();
		this.emp_no = emp_no;
		this.sign_img = sign_img;
		this.sign_img_size = sign_img_size;
	}

	
}
