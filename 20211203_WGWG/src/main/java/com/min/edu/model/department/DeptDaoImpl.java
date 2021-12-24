package com.min.edu.model.department;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.min.edu.vo.emp.Department;

public class DeptDaoImpl implements IDeptDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.department.DeptDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Department> selectDeptAll() {
		logger.info("DeptDaoImpl selectDeptAll");
		return sqlSession.selectList(NS+"selectDeptAll");
	}

	@Override
	public int insertDept(String dept_nm) {
		logger.info("DeptDaoImpl insertDept : ",dept_nm);
		return sqlSession.insert(NS+"insertDept",dept_nm);
	}

	@Override
	public int updateDept(Department dept) {
		logger.info("DeptDaoImpl updateDept : {}",dept);
		return sqlSession.update(NS+"updateDept",dept);
	}

	@Override
	public Department selectDeptByNo(Department dept) {
		logger.info("DeptDaoImpl selectDeptByNo : {}",dept);
		return sqlSession.selectOne(NS+"selectDeptByNo",dept);
	}

}
