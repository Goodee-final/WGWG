package com.min.edu.model.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.approval.Approver;

@Service
public class ApprovalServiceImpl implements IApprovalService {

	@Autowired
	private IApprovalDocDao dao;
	
	@Override
	public List<Approval_Doc> selectAllDoc() {
		return dao.selectAllDoc();
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
	public List<Approval_Doc> selectListWait(Approver approver) {
		return dao.selectListWait(approver);
	}
	
}
