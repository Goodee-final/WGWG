package com.min.edu;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.min.edu.model.form.FormDaoImpl;
import com.min.edu.model.form.IFormDao;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class Form_Test {

	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private IFormDao dao = new FormDaoImpl();
	
	@Test
	public void test() {
		assertNotNull(dao.selectTemplate(1));
	}

}
