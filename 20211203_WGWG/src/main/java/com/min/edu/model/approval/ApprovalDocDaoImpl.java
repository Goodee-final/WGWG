package com.min.edu.model.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.approval.Approval_Doc;

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

}
