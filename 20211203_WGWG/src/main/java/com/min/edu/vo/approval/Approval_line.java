package com.min.edu.vo.approval;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Approval_line {

	private int app_line_no;
	private String approval;
	private String bookmark;
	
	
	public Approval_line(String approval) {
		super();
		this.approval = approval;
	}
	
}
