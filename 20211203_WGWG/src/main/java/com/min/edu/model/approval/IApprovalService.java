package com.min.edu.model.approval;

import java.util.List;

import com.min.edu.vo.approval.Approval_Doc;

public interface IApprovalService {

	public List<Approval_Doc> selectAllDoc();
}
