package com.min.edu.model.approval;

import java.util.List;

import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;

public interface IApprovalDocDao {
	
	public List<Approval_Doc> selectAllDoc();
	public String selectOneDoc(int empno);
	public String selectEmpInfo(int empno);
	public List<Emp> selectAllEmp();
	public List<Department> selectAllDept();
}
