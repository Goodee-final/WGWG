package com.min.edu.model.approval;

import java.util.List;

import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.approval.Approver;

public interface IApprovalService {

	public List<Approval_Doc> selectAllDoc();
	public String selectOneDoc(int empno);
	public Emp selectEmpInfo(int empno);
	public List<Emp> selectAllEmp();
	public List<Department> selectAllDept();
  
	//결재자
	public List<Approval_Doc> selectAllDocApp(int empno);
	//문서 상태에 따른 검색(결재자)
	public List<Approval_Doc> selectListDocStApp(Approval_Doc doc);
	//결재대기함
	public List<Approval_Doc> selectListWait(Approver approver);

}
