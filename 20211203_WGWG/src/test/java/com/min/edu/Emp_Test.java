package com.min.edu;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.min.edu.model.emp.IEmpDao;
import com.min.edu.vo.emp.Emp;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class Emp_Test {

	@Autowired
	private IEmpDao edao;
	
	@Autowired
	private ApplicationContext context;
	
	@Test
	public void test() {
		
//		assertNotNull(context);
		
		Emp emp = new Emp();
		
//		emp.setEmp_nm("홍길순");
//		emp.setEmail("email@email.com");
//		emp.setPw("abc");
//		emp.setPhoto("photo");
//		emp.setAddress("서울시 암사동");
//		emp.setTel("010-1234-5678");
//		emp.setHiredate("2021-12-08");
//		emp.setBirth("1998-04-14");
//		emp.setWork_st("재직");
//		emp.setPosition_no(1);
//		emp.setDept_no(20);
//		emp.setEmp_no(emp.getEmp_no());
//		
//		assertEquals(20211259, edao.insert_emp(emp));
		
//		assertEquals("사업지원팀", edao.selectInsertEmpInfo(20211242).getdVo().getDept_nm());
		
		
		
	}

}
