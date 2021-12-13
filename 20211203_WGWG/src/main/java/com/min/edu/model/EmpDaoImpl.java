package com.min.edu.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.Emp;

@Repository
public class EmpDaoImpl implements IEmpDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.EmpDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insert_emp(Emp emp) {
		logger.info("EmpDaoImpl insert_emp : "+emp);
		int cnt = sqlSession.insert(NS+"insert_emp",emp);
		return (cnt>0)?true:false;
	}

	
}