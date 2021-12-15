package com.min.edu.model.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.approval.Approver;


@Repository
public class ApprovalDocDaoImpl implements IApprovalDocDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.approval.ApprovalDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Approval_Doc> selectAllDoc() {
		logger.info("ApprovalDocDaoImpl selectAll");
		return sqlSession.selectList(NS+"selectAllDoc");
	}


	@Override
	public String selectOneDoc(int empno) {
		logger.info("ApprovalDocDaoImpl selectOneDoc");
		return sqlSession.selectOne(NS+"selectOneDoc", empno);
	}


	@Override
	public String selectEmpInfo(int empno) {
		logger.info("ApprovalDocDaoImpl selectEmpInfo");
		return sqlSession.selectOne(NS+"selectEmpInfo", empno);
	}


	@Override
	public List<Emp> selectAllEmp() {
		logger.info("ApprovalDocDaoImpl selectAllEmp");
		return sqlSession.selectList(NS+"selectAllEmp");
	}


	@Override
	public List<Department> selectAllDept() {
		logger.info("ApprovalDocDaoImpl selectAllDept");
		return sqlSession.selectList(NS + "selectAllDept");
	}


	@Override
	public List<Approval_Doc> selectAllDocApp(int empno) {
		logger.info("ApprovalDocDaoImpl 모든 문서 조회(결재자)");
		return sqlSession.selectList(NS+"selectAllDocApproval",empno);
	}


	@Override
	public List<Approval_Doc> selectListDocStApp(Approval_Doc doc) {
		logger.info("ApprovalDocDaoImpl 문서 상태에 따른 결재 문서 조회(결재자)");
		return sqlSession.selectList(NS+"selectListDocStApp",doc);
	}

	@Override
	public List<Approval_Doc> selectListDocSt(Approval_Doc doc) {
		logger.info("ApprovalDocDaoImpl 문서 상태에 따른 결재 문서 조회(상신자)");
		return sqlSession.selectList(NS+"selectListDocSt",doc);
	}

	@Override
	public List<Approval_Doc> selectListWait(Approver approver) {
		logger.info("ApprovalDocDaoImpl 결재대기 문서 조회 selectListWait");
		
		return sqlSession.selectList(NS+"selectListWait", approver);
	}



}
