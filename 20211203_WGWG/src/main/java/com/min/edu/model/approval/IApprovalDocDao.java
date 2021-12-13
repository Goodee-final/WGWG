package com.min.edu.model.approval;

import java.util.List;

import com.min.edu.vo.approval.Approval_Doc;

public interface IApprovalDocDao {
	
	public List<Approval_Doc> selectAllDoc();
	public String selectOneDoc(int empno);
	public String selectEmpInfo(int empno);
	public String selectAllEmp();
}
