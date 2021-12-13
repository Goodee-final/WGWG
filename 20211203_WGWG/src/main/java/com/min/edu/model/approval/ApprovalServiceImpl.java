package com.min.edu.model.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;

@Service
public class ApprovalServiceImpl implements IApprovalService {

	@Autowired
	private IApprovalDocDao dao;
	
	@Override
	public List<Approval_Doc> selectAllDoc() {
		return dao.selectAllDoc();
	}

	@Override
	public String selectOneDoc(int empno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectEmpInfo(int empno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Emp> selectAllEmp() {
		// TODO Auto-generated method stub
		return dao.selectAllEmp();
	}

	@Override
	public List<Department> selectAllDept() {
		// TODO Auto-generated method stub
		return dao.selectAllDept();
	}
	
	
	
}
