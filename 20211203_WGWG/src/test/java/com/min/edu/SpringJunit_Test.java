package com.min.edu;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.edu.model.EmpDaoImpl;
import com.min.edu.model.IEmpDao;
import com.min.edu.model.form.FormDaoImpl;
import com.min.edu.model.form.IFormDao;
import com.min.edu.vo.Emp;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class SpringJunit_Test {

	
	/*
	 * DispatcherServlet에 의해서 Bean으로 등록되는 과정이 아닌
	 * @ContextConfiguration의 Annotation을 통해서 생성된 Bean을 사용하기 위한 객체
	 */
	@Autowired
	private ApplicationContext context;
	
	/*
	 * bean중에서 root-context.xml에 의해서 생성된 한개의 SqlSessionTemplate bean을 DI(주입)
	 */
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private IFormDao dao = new FormDaoImpl();
	
	@Autowired
	private IEmpDao edao = new EmpDaoImpl();
	
	/*
	 * servlet-context.xml의 <context:component-scan base-package="com.min.edu">에 의해서
	 * base-package 하위에 있는 org.springframwork.stereotype인
	 * @Component @Controller @Service @Repository를 통해서 생성된 Bean.
	 * OCP 구조에 의해서 DaoImpl dao = new DaoImpl(); 이어야 하지만 
	 * implements 구조의 다형성 발생에 의해서 부모의 이름으로 자식을 호출 할 수 있는 형태인
	 * IDao dao = new DaoImpl(); 로 기능을 동작시킨다
	 */

	
	@Test
	public void test() {
		//assertNotNull(dao.selectFormcList());
		assertNotNull(dao.selectFormList());
		//assertNotNull(dao.selectFormDetail(1));
		
		Emp emp = new Emp();
		emp.setEmp_nm("홍길동");
		emp.setEmail("email@email.com");
		emp.setPhoto("photo");
		emp.setAddress("서울시 암사동");
		emp.setTel("010-1234-5678");
		emp.setHiredate("2021-12-08");
		emp.setWork_st(1);
		emp.setPosition_no(1);
		emp.setDept_no(20);
		
		//assertEquals(true, edao.insert_emp(emp));

	}

}
