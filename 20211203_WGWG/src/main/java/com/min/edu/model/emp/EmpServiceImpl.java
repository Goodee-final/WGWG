package com.min.edu.model.emp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.emp.Emp;

@Service
public class EmpServiceImpl implements IEmpService {

	@Autowired
	private IEmpDao dao;
	
	@Override
	public int insert_emp(Emp emp) {
		dao.insert_emp(emp);
		return emp.getEmp_no();
	}

	@Override
	public Emp getLogin(Emp emp) {
		return dao.getLogin(emp);
	}

	@Override
	public String getRandomPw() {
		return dao.getRandomPw();
	}

	@Override
	public String getEmailByEmpno(int emp_no) {
		return dao.getEmailByEmpno(emp_no);
	}
	
	@Override
	public int updatePW(Emp emp) {
		return dao.updatePW(emp);
	}

	@Override
	public Emp selectInsertEmpInfo(int emp_no) {
		return dao.selectInsertEmpInfo(emp_no);
	}

}
