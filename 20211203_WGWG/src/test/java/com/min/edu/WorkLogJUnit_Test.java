package com.min.edu;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
//		assertNotNull(dao);

		// selectAllDeptWorkLog 테스트
//		List<WorkLog> deptLists = dao.selectAllDeptWorkLog(10);
//		assertNotNull(deptLists);

		// selectAllDeptWorkLog 테스트
//		List<WorkLog> myLists = dao.selectAllMyWorkLog(9);
//		assertNotNull(myLists);

//		WorkLog w = dao.selectDetailWorkLog(1);
//		assertNotNull(w);

//		List<WorkLog> searchLists = dao.searchWorkLog("주");
//		System.out.println(searchLists);
//		assertNotNull(searchLists);

//		WorkLog w = new WorkLog();
//		w.setWorklog_content("제이유닛 테스트");
//		w.setEmp_no(1);
//		assertNotNull(dao.insertWorkLog(w));

//		WorkLog w = dao.selectDetailWorkLog(161);
//		w.setWorklog_content("수정 제이유닛 테스트 수정");
//		assertNotNull(dao.updateWorkLogContent(w));

//		Emp p = dao.selectEmpNo(1);
//		System.out.println(p.toString());
//		assertNotNull(p);

		Map<String, Object> map = new HashMap<String, Object>();
		List<WorkLog> mlist = new ArrayList<WorkLog>();
		map.put("startDate", "20211111");
		map.put("endDate", "20211115");
		// map 에 들어간 키랑 밸류 출력해보기
		for (String key : map.keySet()) {
			String value = (String) map.get(key);
			System.out.println("[key]:" + key + ", [value]:" + value);
		}
		mlist = dao.searchByDate(map);
		System.out.println("$$$ mlist $$$" + mlist);
//		mlist.add((Map<String, Object>) dao.searchByDate(map));
//		System.out.println("리스트 확인 1번째 방법");
//		for (int i = 0; i < mlist.size(); i++) {
//			System.out.println(mlist.get(i).toString());
//		}
//
//		System.out.println("\n\n리스트 확인 2번째 방법");
//
//		for (Object ob : mlist) {
//			System.out.println(ob.toString());
//		}

		assertNotNull(dao.searchByDate(map));

	}

}
