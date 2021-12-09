package com.min.edu.model;

import java.util.List;

import com.min.edu.vo.ScheduleVO;

public interface IScheduleDao {
	//개인일정 등록
	public int insertScheduleP(ScheduleVO vo);
	//회사일정 등록
	public int insertScheduleC(ScheduleVO vo);
	//개인일정 list검색
	public List<ScheduleVO> getAllPerList(int emp_no);
	//회사일정 list검색
	public List<ScheduleVO> getAllComList();
	//공유일정 list검색
	public List<ScheduleVO>	getAllSharedList(int emp_no);
	//개인일정 상세보기
	public ScheduleVO getOnePerson(int schedule_no);
	//회사일정 상세보기
	public ScheduleVO getOneCompany(int schedule_no);
	//개인일정 수정
	public int updateScheduleP(ScheduleVO vo);
	//회사일정 수정
	
	
	
	//개인일정 삭제
	public int deleteScheduleP(int schedule_no);	
	//회사일정 삭제
	public int deleteScheduleC(int schedule_no);
	//test
	public ScheduleVO test(int schedule_no);
}
