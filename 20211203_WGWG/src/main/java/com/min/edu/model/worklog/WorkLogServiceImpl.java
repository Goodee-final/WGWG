package com.min.edu.model.worklog;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.worklog.WorkLog;

@Service
public class WorkLogServiceImpl implements IWorkLogService {

	@Autowired
	private IWorkLogDao dao;

	@Override
	public List<WorkLog> selectAllDeptWorkLog(int dept_no) {
		return dao.selectAllDeptWorkLog(dept_no);
	}

	@Override
	public List<WorkLog> selectAllMyWorkLog(int emp_no) {
		return dao.selectAllMyWorkLog(emp_no);
	}

	@Override
	public WorkLog selectDetailWorkLog(int worklog_no) {
		return dao.selectDetailWorkLog(worklog_no);
	}

	@Override
	public List<WorkLog> searchWorkLog(Map<String, String> map) {
		return dao.searchWorkLog(map);
	}

	@Override
	public int insertWorkLog(WorkLog workLog) {
		return dao.insertWorkLog(workLog);
	}

	@Override
	public int updateWorkLogContent(WorkLog workLog) {
		return dao.updateWorkLogContent(workLog);
	}

	@Override
	public int updateWorkLogDelflag(Map<String, String[]> worklog_nos) {
		return dao.updateWorkLogDelflag(worklog_nos);
	}

	@Override
	public int deleteWorkLog(Map<String, String[]> worklog_nos) {
		return dao.deleteWorkLog(worklog_nos);
	}

}
