package com.min.edu.model.department;

import java.util.List;

import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Dept_Page;

public interface IDeptDao {

	public List<Department> selectAllDept();
	
	public int insertDept(String dept_nm);
	
	public int updateDept(Department dept);
	
	public Department selectDeptByNo(int dept_no);
	
	public List<Department> selectDeptPaging (Dept_Page paging);
	
	public int selectTotalDept();
}
