package com.min.edu.model.emp;

import com.min.edu.vo.emp.Emp;

public interface IEmpService {

	public int insert_emp(Emp emp);
	
	public Emp getLogin(Emp emp);
	
	public String getRandomPw();
	
	public String getEmailByEmpno(int emp_no);
	
	public int updatePW(Emp emp);
	
}
