package com.min.edu.cron;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CronDaoImpl implements CronDao {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.cron.CronDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public void drop_seq() {
		logger.info("EmpDaoImpl 시퀀스 삭제");
		sqlSession.update(NS+"drop_seq");
	}

	@Override
	public void create_seq() {
		logger.info("EmpDaoImpl 시퀀스 생성");
		sqlSession.insert(NS+"create_seq");
	}

	@Override
	public void run_test() {
		logger.info("##### run_test ");
		System.out.println("runtest...ing");
	}
}
