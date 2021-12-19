package com.min.edu.model.approval;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.approval.Approval_Page;
import com.min.edu.vo.approval.Approval_line;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Position;
import com.min.edu.vo.approval.Approver;


@Repository
public class ApprovalDocDaoImpl implements IApprovalDocDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.approval.ApprovalDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Approval_Doc> selectmyAllDoc(int empno) {
		logger.info("ApprovalDocDaoImpl selectmyAllDoc(개인문서함)");
		return sqlSession.selectList(NS+"selectmyAllDoc", empno);
	}
	
	@Override
	public List<Approval_Doc> searchdoclist(String title, int empno) {
		logger.info("ApprovalDocDaoImpl searchdoclist(개인문서함)", title);
		return sqlSession.selectList(NS+"searchdoclist", title);
	}

	@Override
	public Approval_Doc selectOneDoc(int docno) {
		logger.info("ApprovalDocDaoImpl 문서 상세 조회");
		return sqlSession.selectOne(NS+"selectOneDoc", docno);
	}


	@Override
	public Emp selectEmpInfo(int empno) {
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
	public List<Position> selectAllPosition() {
		logger.info("ApprovalDocDaoImpl selectAllPosition");
		return sqlSession.selectList(NS + "selectAllPosition");
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

	@Override
	public int updateDocSt(Approval_Doc doc) {
		logger.info("ApprovalDocDaoImpl 문서 상태 업데이트 updateDocSt");
		return sqlSession.update(NS+"updateDocSt", doc);
	}

	@Override
	public int updateApproval(Approval_line line) {
		logger.info("ApprovalDocDaoImpl 결재자 JSON 상태 업데이트 updateApproval");
		return sqlSession.update(NS+"updateApproval", line);
		
	}

	@Override
	public List<Approval_Doc> selectDocPaging(Approval_Doc doc) {
		logger.info("ApprovalDocDaoImpl 페이징 처리 selectPaging");
		
		return sqlSession.selectList(NS+"selectDocPaging", doc);
	}

	@Override
	public int selectTotalPaging(Approval_Doc doc) {
		logger.info("ApprovalDocDaoImpl 페이징 처리 selectTotalPaging");
		return sqlSession.selectOne(NS+"selectTotalPaging", doc);
	}

}
