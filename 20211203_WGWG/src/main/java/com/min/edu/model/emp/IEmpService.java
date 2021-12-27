package com.min.edu.model.emp;


import java.util.List;

import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Emp_Page;

public interface IEmpService {

	public int insert_emp(Emp emp);
	
	public Emp getLogin(Emp emp);
	
	public String getRandomPw();
	
	public String getEmailByEmpno(int emp_no);
	
	public int updatePW(Emp emp);
	
	public Emp selectInsertEmpInfo(int emp_no);
	
	public List<Emp> selectEmpAll();
	
	public Emp selectEmpByNo(int emp_no);
	
	public List<Emp> selectPaging(Emp_Page paging);
	
	public int selectTotalPaging();
	
	public int updateEmp(Emp emp);
	
	public String getSessionPW(int emp_no);
	
	public Emp selectMyPage(int emp_no);
	
	public int updateMyPage(Emp emp);
}
