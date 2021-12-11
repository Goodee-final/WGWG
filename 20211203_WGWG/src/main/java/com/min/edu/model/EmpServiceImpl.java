package com.min.edu.model;

import org.springframework.beans.factory.annotation.Autowired;

import com.min.edu.vo.Emp;

public class EmpServiceImpl implements IEmpService {

	@Autowired
	IEmpDao dao;
	
	@Override
	public boolean insert_emp(Emp emp) {
		Boolean result = dao.insert_emp(emp);
		return result;
	}

}
