package com.min.edu.model.approval;

import java.util.List;

import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.approval.Approver;

public interface IApprovalDocDao {
	
	//전체문서 출력
	public List<Approval_Doc> selectmyAllDoc(int empno);
	//문서 검색
	public List<Approval_Doc> searchdoclist(String title, int empno);
	//문서 상세
	public String selectOneDoc(int empno);
	//기안할 때 작성자 정보 출력
	public Emp selectEmpInfo(int empno);
	//결재라인
	public List<Emp> selectAllEmp();
	public List<Department> selectAllDept();
	
	//결재자
	public List<Approval_Doc> selectAllDocApp(int empno);
	//문서 상태에 따른 검색(결재자)
	public List<Approval_Doc> selectListDocStApp(Approval_Doc doc);
	//문서 상태에 따른 검색(상신자)
	public List<Approval_Doc> selectListDocSt(Approval_Doc doc);
	//결재대기함
	public List<Approval_Doc> selectListWait(Approver approver);
	

}
