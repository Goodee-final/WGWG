package com.min.edu.model.worklog;

import java.util.List;
import java.util.Map;

import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.worklog.WorkLog;

public interface IWorkLogDao {

	public List<WorkLog> selectAllDeptWorkLog(int dept_no);

	public List<WorkLog> selectAllMyWorkLog(int emp_no);

	public WorkLog selectDetailWorkLog(int worklog_no);

//	public List<WorkLog> searchWorkLog(Map<String, String> map);
	public List<WorkLog> searchWorkLog(String searchWord);
//	public List<WorkLog> searchByDate(String startDate, String endDate);
	public List<WorkLog> searchByDate(Map<String, Object> map);
	
	
	public int insertWorkLog(WorkLog workLog);

	public int updateWorkLogContent(WorkLog workLog);

//	public int updateWorkLogDelflag(Map<String, String[]> worklog_nos);

//	public int deleteWorkLog(Map<String, String[]> worklog_nos);

	//
//	public Emp selectEmpDP(int emp_no);
	public Emp selectEmpNo(int emp_no);

}
