package com.min.edu.model.worklog;

import java.util.List;
import java.util.Map;

import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.worklog.WorkLog;

public interface IWorkLogService {

	public List<WorkLog> selectAllDeptWorkLog(int dept_no);

	public List<WorkLog> selectAllMyWorkLog(int emp_no);

	public WorkLog selectDetailWorkLog(int worklog_no);

	public List<WorkLog> searchWorkLog(String searchWord);
	
	public int insertWorkLog(WorkLog workLog);

	public int updateWorkLogContent(WorkLog workLog);

//	public int updateWorkLogDelflag(Map<String, String[]> worklog_nos);

//	public int deleteWorkLog(Map<String, String[]> worklog_nos);
	
	//
	public List<Department> selectAllDept();
	public Emp selectEmpNo(int emp_no);

}
