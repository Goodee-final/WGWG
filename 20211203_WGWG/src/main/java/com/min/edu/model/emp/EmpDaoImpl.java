package com.min.edu.model.emp;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Emp_Page;
import com.min.edu.vo.paging.PageVO;

@Repository
public class EmpDaoImpl implements IEmpDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.emp.EmpDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_emp(Emp emp) {
		logger.info("EmpDaoImpl insert_emp : "+emp);
		sqlSession.insert(NS+"insert_emp",emp);
		return emp.getEmp_no();
	}

	@Override
	public Emp getLogin(Emp emp) {
		logger.info("LoginDaoImpl 로그인 : " + emp);
		return sqlSession.selectOne(NS+"getLogin", emp);
	}

	@Override
	public String getRandomPw() {
		return sqlSession.selectOne(NS+"getRandomPw");
	}

	@Override
	public String getEmailByEmpno(int emp_no) {
		logger.info("EmpDaoImpl getEmailByEmpno : ",emp_no);
		return sqlSession.selectOne(NS+"getEmailByEmpno",emp_no);
	}
	
	@Override
	public int updatePW(Emp emp) {
		logger.info("EmpDaoImpl 임시 비밀번호 업데이트 : {}",emp);
		return sqlSession.update(NS+"updatePW",emp);
	}

	@Override
	public Emp selectInsertEmpInfo(int emp_no) {
		return sqlSession.selectOne(NS+"selectInsertEmpInfo",emp_no);
	}

	@Override
	public List<Emp> selectEmpAll() {
		logger.info("EmpDaoImpl  selectEmpAll");
		return sqlSession.selectList(NS+"selectEmpAll");
	}

	@Override
	public List<Emp> selectPaging(Emp_Page paging) {
		return sqlSession.selectList(NS+"selectPaging",paging);
	}

	@Override
	public int selectTotalPaging() {
		return sqlSession.selectOne(NS+"selectTotalPaging");
	}

	
}
