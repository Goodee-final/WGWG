package com.min.edu.model.emp;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Emp_Page;

@Service
public class EmpServiceImpl implements IEmpService {

	@Autowired
	private IEmpDao dao;
	
	@Override
	public int insert_emp(Emp emp) {
		dao.insert_emp(emp);
		return emp.getEmp_no();
	}

	@Override
	public Emp getLogin(Emp emp) {
		return dao.getLogin(emp);
	}

	@Override
	public String getRandomPw() {
		return dao.getRandomPw();
	}

	@Override
	public String getEmailByEmpno(int emp_no) {
		return dao.getEmailByEmpno(emp_no);
	}
	
	@Override
	public int updatePW(Emp emp) {
		return dao.updatePW(emp);
	}

	@Override
	public Emp selectInsertEmpInfo(int emp_no) {
		return dao.selectInsertEmpInfo(emp_no);
	}

	@Override
	public List<Emp> selectEmpAll() {
		return dao.selectEmpAll();
	}

	@Override
	public List<Emp> selectPaging(Emp_Page paging) {
		return dao.selectPaging(paging);
	}

	@Override
	public int selectTotalPaging() {
		return dao.selectTotalPaging();
	}

	@Override
	public Emp selectEmpByNo(int emp_no) {
		return dao.selectEmpByNo(emp_no);
	}

	@Override
	public int updateEmp(Emp emp) {
		return dao.updateEmp(emp);
	}

	@Override
	public String getSessionPW(int emp_no) {
		return dao.getSessionPW(emp_no);
	}

	@Override
	public Emp selectMyPage(int emp_no) {
		return dao.selectMyPage(emp_no);
	}

	@Override
	public int updateMyPage(Emp emp) {
		return dao.updateMyPage(emp);
	}

	@Override
	public int updateMyPage_NoPhoto(Emp emp) {
		return dao.updateMyPage_NoPhoto(emp);
	}

}
