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
	public List<Approval_Doc> selectmyAllDoc(Approval_Doc doc) {
		return dao.selectmyAllDoc(doc);
	}
	
	@Override
	public List<Approval_Doc> searchdoclist(String title, int empno) {
		return dao.searchdoclist(title, empno);
	}

	@Override
	public Approval_Doc selectOneDoc(int docno) {
		return dao.selectOneDoc(docno);
	}

	@Override
	public Emp selectEmpInfo(int empno) {
		return dao.selectEmpInfo(empno);
	}

	@Override
	public List<Emp> selectAllEmp() {
		return dao.selectAllEmp();
	}

	@Override
	public List<Department> selectAllDept() {
		return dao.selectAllDept();
	}
	
	@Override
	public List<Position> selectAllPosition() {
		return dao.selectAllPosition();
	}
	
	@Override
	public int insertDoc(Approval_Doc doc) {
		return dao.insertDoc(doc);
	}
	
	@Override
	public int insertappline(Approval_line appline) {
		return dao.insertappline(appline);
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

	@Override
	public int selectTotalPagingApp(Approval_Doc doc) {
		return dao.selectTotalPagingApp(doc);
	}

	@Override
	public List<Approval_Doc> selectListRef(Approval_Doc doc) {
		return dao.selectListRef(doc);
	}

	@Override
	public int selectTotalPagingRef(Approval_Doc doc) {
		return dao.selectTotalPagingRef(doc);
	}

	@Override
	public List<Approver> selectSignList(int appLineNo) {
		return dao.selectSignList(appLineNo);
	}

	@Override
	public int selectTotalPagingAll(Approval_Doc doc) {
		
		return dao.selectTotalPagingAll(doc);
	}

}
