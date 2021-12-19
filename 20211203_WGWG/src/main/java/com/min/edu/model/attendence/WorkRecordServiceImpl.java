package com.min.edu.model.attendence;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.attendence.WorkRecord;

@Service
public class WorkRecordServiceImpl implements IWorkRecordService {

	@Autowired
	private IWorkRecordDao dao;
	
	@Override
	public WorkRecord selectwr(int emp_no) {
		return dao.selectwr(emp_no);
	}

}
