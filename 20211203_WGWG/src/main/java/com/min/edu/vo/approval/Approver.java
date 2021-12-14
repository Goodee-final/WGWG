package com.min.edu.vo.approval;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Approver {

	private int emp_no;			// 결재자 회원 번호
	private String approval_st;	// 승인 여부
	private String reason;		// 반려 이유
	private String approval_dt;	// 결재일 
	private int waiting;		// 대기 여부
}
