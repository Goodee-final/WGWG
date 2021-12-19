package com.min.edu.model.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.approval.Approval_Page;
import com.min.edu.vo.approval.Approval_line;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Position;
import com.min.edu.vo.approval.Approver;

@Service
public class ApprovalServiceImpl implements IApprovalService {

	@Autowired
	private IApprovalDocDao dao;
	
	@Override
	public List<Approval_Doc> selectmyAllDoc(int empno) {
		return dao.selectmyAllDoc(empno);
	}
	
	@Override
	public List<Approval_Doc> searchdoclist(String title, int empno) {
		return dao.searchdoclist(title, empno);
	}

	@Override
	public Approval_Doc selectOneDoc(int docno) {
		// TODO Auto-generated method stub
		return dao.selectOneDoc(docno);
	}

	@Override
	public Emp selectEmpInfo(int empno) {
		// TODO Auto-generated method stub
		return dao.selectEmpInfo(empno);
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
	
	@Override
	public List<Position> selectAllPosition() {
		// TODO Auto-generated method stub
		return dao.selectAllPosition();
	}
	
	@Override
	public List<Approval_Doc> selectAllDocApp(int empno) {
		return dao.selectAllDocApp(empno);
	}

	@Override
	public List<Approval_Doc> selectListDocStApp(Approval_Doc doc) {
		return dao.selectListDocStApp(doc);
	}

	@Override
	public List<Approval_Doc> selectListDocSt(Approval_Doc doc) {
		return dao.selectListDocSt(doc);
	}

	@Override
	public List<Approval_Doc> selectListWait(Approver approver) {
		return dao.selectListWait(approver);
	}

	@Override
	public int updateDocSt(Approval_Doc doc) {
		return dao.updateDocSt(doc);
	}

	@Override
	public int updateApproval(Approval_line line) {
		return dao.updateApproval(line);
	}

	@Override
	public List<Approval_Doc> selectDocPaging(Approval_Doc doc) {
		
		return dao.selectDocPaging(doc);
	}

	@Override
	public int selectTotalPaging(Approval_Doc doc) {
		return dao.selectTotalPaging(doc);
	}



}
