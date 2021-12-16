package com.min.edu.model.attendence;

import com.min.edu.vo.attendence.WorkRecord;

public interface IWorkRecordDao {

	public WorkRecord selectworkrecord(int empno);
}
