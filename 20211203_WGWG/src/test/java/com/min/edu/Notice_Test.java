package com.min.edu;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.edu.model.INoticeDao;
import com.min.edu.model.NoticeServiceImpl;
import com.min.edu.vo.NoticeFileVO;
import com.min.edu.vo.NoticePageVO;
import com.min.edu.vo.NoticeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class Notice_Test {

	
	@Autowired
	private ApplicationContext context;	
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private INoticeDao dao;
	@Test
	public void test() {
		
//		NoticeVO vo = dao.getBoard(1);
//		assertNotNull(vo);
		
//		NoticeFileVO fvo = dao.getFile(1);
//		assertNotNull(fvo);
		
		
	}

}
