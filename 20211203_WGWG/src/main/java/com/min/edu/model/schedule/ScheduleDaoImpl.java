package com.min.edu.model.schedule;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.min.edu.vo.schedule.ScheduleVO;

@Repository
public class ScheduleDaoImpl implements IScheduleDao {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS ="com.min.edu.model.schedule.ScheduleDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Override
	public int insertScheduleP(ScheduleVO vo) {
		logger.info("insertScheduleP 입력");		
		return sqlSession.insert(NS+"insertScheduleP",vo);
	}

	@Override
	public int insertScheduleC(ScheduleVO vo) {
		logger.info("insertScheduleC 입력");		
		return sqlSession.insert(NS+"insertScheduleC",vo);
	}

	@Override
	public List<ScheduleVO> getAllPerList(int emp_no) {
		logger.info("getAllPerList 검색");		
		return sqlSession.selectList(NS+"getAllPerList",emp_no);
	}

	@Override
	public List<ScheduleVO> getAllComList() {
		logger.info("getAllComList 검색");
		return sqlSession.selectList(NS+"getAllComList");
	}
	@Override
	public List<ScheduleVO> getAllSharedList(int emp_no) {
		logger.info("getAllSharedList 리스트검색");
		return sqlSession.selectList(NS+"getAllSharedList",emp_no);
	}
	@Override
	public int updateScheduleP(ScheduleVO vo) {
		logger.info("updateScheduleP 수정");
		return sqlSession.update(NS+"updateScheduleP",vo);
	}

	@Override
	public ScheduleVO getOnePerson(int schedule_no) {
		logger.info("getOnePerson 상세보기");
		return sqlSession.selectOne(NS+"getOnePerson",schedule_no);
	}

	@Override
	public ScheduleVO getOneCompany(int schedule_no) {
		logger.info("getOneCompany 상세보기");
		return sqlSession.selectOne(NS+"getOneCompany",schedule_no);
	}

	@Override
	public int deleteScheduleP(int schedule_no) {
		logger.info("deleteScheduleP 삭제");
		return sqlSession.delete(NS+"deleteScheduleP",schedule_no);
	}

	@Override
	public int deleteScheduleC(int schedule_no) {
		logger.info("deleteScheduleC 삭제");
		return sqlSession.delete(NS+"deleteScheduleC",schedule_no);
	}

	@Override
	public ScheduleVO test(int schedule_no) {
		logger.info("test(공유 수락한 사람들 목록에 표출");
		return sqlSession.selectOne(NS+"test",schedule_no);
	}

	

}
