package com.min.edu;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.min.edu.model.worklog.IWorkLogDao;
import com.min.edu.vo.worklog.WorkLog;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class WorkLogJUnit_Test {

	@Autowired
	private ApplicationContext applicationContext;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private IWorkLogDao dao;

	@Test
	public void test() {
//		assertNotNull(applicationContext);
//		assertNotNull(sqlSession);
		
		// selectAllDeptWorkLog 테스트
		List<WorkLog> deptlists = dao.selectAllDeptWorkLog(10);
		assertNotNull(deptlists);
	}

}
