package com.min.edu.model.worklog;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.worklog.WorkLog;

@Repository
public class WorkLogDaoImpl implements IWorkLogDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.worklog.WorkLogDaoImpl.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<WorkLog> selectAllDeptWorkLog(int dept_no) {
		logger.info("WorkLogDaoImpl selectAllDeptWorkLog 업무일지 부서별 조회");
		return sqlSession.selectList(NS + "selectAllDeptWorkLog", dept_no);
	}

	@Override
	public List<WorkLog> selectAllMyWorkLog(int emp_no) {
		logger.info("WorkLogDaoImpl selectAllMyWorkLog 업무일지 개인별 조회");
		return sqlSession.selectList(NS + "selectAllMyWorkLog", emp_no);
	}

	@Override
	public WorkLog selectDetailWorkLog(int worklog_no) {
		logger.info("WorkLogDaoImpl selectDetailWorkLog 업무일지 상세 조회");
		return sqlSession.selectOne(NS + "selectDetailWorkLog", worklog_no);
	}

	@Override
	public List<WorkLog> searchWorkLog(String searchWord) {
		logger.info("WorkLogDaoImpl searchWorkLog 업무일지 검색");
		return sqlSession.selectList(NS + "searchWorkLog", searchWord);
	}

	@Override
	public int insertWorkLog(WorkLog workLog) {
		logger.info("WorkLogDaoImpl insertWorkLog 업무일지 등록");
		return sqlSession.insert(NS + "insertWorkLog", workLog);
	}

	@Override
	public int updateWorkLogContent(WorkLog workLog) {
		logger.info("WorkLogDaoImpl updateWorkLogContent 업무일지 내용 수정");
		return sqlSession.update(NS + "updateWorkLogContent", workLog);
	}

	@Override
	public int updateWorkLogDelflag(Map<String, String[]> worklog_nos) {
		logger.info("WorkLogDaoImpl selectAllDeptWorkLog 델플래그 상태 변경");
		return sqlSession.update(NS + "updateWorkLogDelflag", worklog_nos);
	}

	@Override
	public int deleteWorkLog(Map<String, String[]> worklog_nos) {
		logger.info("WorkLogDaoImpl selectAllDeptWorkLog 업무일지 완전 삭제");
		return sqlSession.delete(NS + "deleteWorkLog", worklog_nos);
	}

}
