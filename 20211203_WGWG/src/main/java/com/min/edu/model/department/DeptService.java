package com.min.edu.model.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Dept_Page;

@Service
public class DeptService implements IDeptService{

	@Autowired
	private IDeptDao dao;
	

	@Override
	public int insertDept(String dept_nm) {
		return dao.insertDept(dept_nm);
	}

	@Override
	public int updateDept(Department dept) {
		return dao.updateDept(dept);
	}

	@Override
	public Department selectDeptByNo(int dept_no) {
		return dao.selectDeptByNo(dept_no);
	}

	@Override
	public List<Department> selectAllDept() {
		return dao.selectAllDept();
	}

	@Override
	public List<Department> selectDeptPaging(Dept_Page paging) {
		return dao.selectDeptPaging(paging);
	}

	@Override
	public int selectTotalDept() {
		return dao.selectTotalDept();
	}

}
