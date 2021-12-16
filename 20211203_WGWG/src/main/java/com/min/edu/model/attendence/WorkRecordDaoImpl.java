package com.min.edu.model.attendence;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.attendence.WorkRecord;
@Repository
public class WorkRecordDaoImpl implements IWorkRecordDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.attendence.WorkRecordDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public WorkRecord selectwr(int emp_no) {
		logger.info("근무기록 조회 {}", emp_no);
		return sqlSession.selectOne(NS+"selectwr", emp_no);
	}

}
