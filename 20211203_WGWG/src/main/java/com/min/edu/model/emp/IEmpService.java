package com.min.edu.model.emp;

import java.util.Map;

import com.min.edu.vo.emp.Emp;

public interface IEmpService {

	public boolean insert_emp(Emp emp);
	
	public Emp getLogin(Map<String,Object> map); 
}
