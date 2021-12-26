package com.min.edu.model.schedule;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.schedule.ScheduleVO;

@Service
public class ServiceScheduleImpl2 implements IServiceSchedule2 {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IScheduleDao dao;
	@Override
	public int insertScheduleP(ScheduleVO vo) {
		logger.info("insertScheduleP{} \t",vo);
		return dao.insertScheduleP(vo);
	}

	@Override
	public int insertScheduleC(ScheduleVO vo) {
		logger.info("insertScheduleC{} \t",vo);
		return dao.insertScheduleC(vo);
	}

	@Override
	public List<ScheduleVO> getAllPerList(int emp_no) {
		logger.info("ServiceScheduleImpl2에 getAllPerList{}",emp_no);
		return dao.getAllPerList(emp_no);
	}

	@Override
	public List<ScheduleVO> getAllComList() {
		logger.info("ServiceScheduleImpl2에 getAllComList");
		return dao.getAllComList();
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
		logger.info("ServiceScheduleImpl2에 개인일정 수정 updateScheduleP{}",vo);
		return dao.updateScheduleP(vo);
	}
	@Override
	public int updateScheduleC(ScheduleVO vo) {
		logger.info("ServiceScheduleImpl2에 회사일정 수정 updateScheduleC{}",vo);
		return dao.updateScheduleC(vo);
	}
	@Override
	public int deleteScheduleP(int schedule_no) {
		logger.info("ServiceScheduleImpl2에 일정 삭제 deleteScheduleP{}",schedule_no);
		return dao.deleteScheduleP(schedule_no);
	}

	@Override
	public int deleteScheduleC(int schedule_no) {
		logger.info("ServiceScheduleImpl2에 일정 삭제 deleteScheduleC{}",schedule_no);
		return dao.deleteScheduleC(schedule_no);
	}

	@Override
	public ScheduleVO test(int schedule_no) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
