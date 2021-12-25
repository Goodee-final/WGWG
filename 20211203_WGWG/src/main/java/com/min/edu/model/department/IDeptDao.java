package com.min.edu.model.department;

import java.util.List;

import com.min.edu.vo.emp.Department;

public interface IDeptDao {

	public List<Department> selectDeptAll();
	
	public int insertDept(String dept_nm);
	
	public int updateDept(Department dept);
	
	public Department selectDeptByNo(Department dept);
}
