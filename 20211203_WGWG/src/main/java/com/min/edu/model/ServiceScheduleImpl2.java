package com.min.edu.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.ScheduleVO;

@Service
public class ServiceScheduleImpl2 implements IServiceSchedule2 {

	
	
	@Autowired
	private IScheduleDao dao;
	@Override
	public int insertScheduleP(ScheduleVO vo) {
		
		return dao.insertScheduleP(vo);
	}

	@Override
	public int insertScheduleC(ScheduleVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ScheduleVO> getAllPerList(int emp_no) {
		
		return dao.getAllPerList(emp_no);
	}

	@Override
	public List<ScheduleVO> getAllComList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ScheduleVO> getAllSharedList(int emp_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ScheduleVO getOnePerson(int schedule_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ScheduleVO getOneCompany(int schedule_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateScheduleP(ScheduleVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteScheduleP(int schedule_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteScheduleC(int schedule_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ScheduleVO test(int schedule_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
