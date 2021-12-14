package com.min.edu.model.emp;

import java.util.Map;

import com.min.edu.vo.emp.Department;

import com.min.edu.vo.emp.Emp;

public interface IEmpDao {
	
	public boolean insert_emp(Emp emp);
	
	public Emp getLogin(Emp emp);
}
