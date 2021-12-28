package com.min.edu.model.department;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Dept_Page;

@Repository
public class DeptDaoImpl implements IDeptDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.department.DeptDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
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
	public Department selectDeptByNo(int dept_no) {
		logger.info("DeptDaoImpl selectDeptByNo : {}",dept_no);
		return sqlSession.selectOne(NS+"selectDeptByNo",dept_no);
	}

	@Override
	public List<Department> selectAllDept() {
		logger.info("DeptDaoImpl selectAllDept");
		return sqlSession.selectList(NS+"selectAllDept");
	}

	@Override
	public List<Department> selectDeptPaging(Dept_Page paging) {
		logger.info("DeptDaoImpl selectDeptPaging : {}",paging);
		return sqlSession.selectList(NS+"selectDeptPaging",paging);
	}

	@Override
	public int selectTotalDept() {
		logger.info("DeptDaoImpl selectTotalDept");
		return sqlSession.selectOne(NS+"selectTotalDept");
	}

}
