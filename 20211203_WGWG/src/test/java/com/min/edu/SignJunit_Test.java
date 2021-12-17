package com.min.edu;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.edu.model.approval.IApprovalDocDao;
import com.min.edu.model.sign.ISignDao;
import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.approval.Approver;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class SignJunit_Test {

	

	@Autowired
	private ApplicationContext context;
	
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private ISignDao dao;
	
	@Autowired
	private IApprovalDocDao dao2;
	
	
	@Test
	public void test() {
		
//		assertNotNull(dao.selectSignList(1));
//		assertNotNull(dao2.selectAllDocApp(1));
		Approval_Doc doc = new Approval_Doc();
		
		//문서 상태에 따른 결재자 문서 조회
		doc.setEmp_no(1);
		doc.setApp_doc_st("완료");
//		assertNotNull(dao2.selectListDocStApp(doc));
		assertNotNull(dao2.selectListDocSt(doc));
		
		//결재 대기함 조회(결재자 번호, waiting:0)
//		Approver app = new Approver();
//		app.setEmp_no(2);
//		app.setWaiting(0);
//		assertNotNull(dao2.selectListWait(app));
		
		
	}

}
