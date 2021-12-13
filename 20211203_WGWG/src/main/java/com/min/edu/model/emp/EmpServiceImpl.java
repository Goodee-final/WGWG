package com.min.edu.model.emp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.emp.Emp;

@Service
public class EmpServiceImpl implements IEmpService {

	@Autowired
	IEmpDao dao;
	
	@Override
	public boolean insert_emp(Emp emp) {
		Boolean result = dao.insert_emp(emp);
		return result;
	}

	@Override
	public Emp getLogin(Emp emp) {
		return dao.getLogin(emp);
	}

}
