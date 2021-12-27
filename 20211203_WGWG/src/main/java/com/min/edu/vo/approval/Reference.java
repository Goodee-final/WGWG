package com.min.edu.vo.approval;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Reference {
	
	private String app_doc_no;
	private int emp_no;
	private String feedback;
}
