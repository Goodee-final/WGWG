package com.min.edu.model.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.min.edu.vo.emp.Department;

public class DeptService implements IDeptService{

	@Autowired
	private IDeptDao dao;
	
	@Override
	public List<Department> selectDeptAll() {
		return dao.selectDeptAll();
	}

	@Override
	public int insertDept(String dept_nm) {
		return dao.insertDept(dept_nm);
	}

	@Override
	public int updateDept(Department dept) {
		return dao.updateDept(dept);
	}

	@Override
	public Department selectDeptByNo(Department dept) {
		return dao.selectDeptByNo(dept);
	}

}
