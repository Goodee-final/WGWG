package com.min.edu;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.edu.model.ISignDao;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class SignJunit_Test {

	

	@Autowired
	private ApplicationContext context;
	
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private ISignDao dao;
	
	
	
	@Test
	public void test() {
		
		assertNotNull(dao.selectSignList(1));

	}

}
