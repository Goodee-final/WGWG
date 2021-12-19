package com.min.edu;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.min.edu.model.approval.IApprovalDocDao;
import com.min.edu.model.sign.ISignDao;
import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.approval.Approval_line;
import com.min.edu.vo.approval.Approver;
import com.min.edu.vo.sign.Sign;

@WebAppConfiguration
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
	private IApprovalDocDao approvalServiceImpl;
	
	
	@Test
	public void test() {
		
		assertNotNull(dao.selectSignList(1));
//		assertNotNull(dao2.selectAllDocApp(1));
//		Approval_Doc doc = new Approval_Doc();
		
		//문서 상태에 따른 결재자 문서 조회
//		doc.setEmp_no(1);
//		doc.setApp_doc_st("완료");
//		assertNotNull(dao2.selectListDocStApp(doc));
//		assertNotNull(dao2.selectListDocSt(doc));
		
		//결재 대기함 조회(결재자 번호, waiting:0)
//		Approver app = new Approver();
//		app.setEmp_no(2);
//		app.setWaiting(0);
//		assertNotNull(dao2.selectListWait(app));
		
		
		
		
	

			//현재시간
			Date date = new Date(System.currentTimeMillis());
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String nowTime = format.format(date);

			// 라인에 싸인 정보 저장
			
			
			
			
			Gson gson = new Gson();

			// 내 결재 대기 상태 n로 변경
			Approval_line appline = approvalServiceImpl.selectOneDoc(1).getAlvo();
			int lineNo = approvalServiceImpl.selectOneDoc(1).getApp_line_no();
			appline.setApp_line_no(lineNo);
			System.out.println("라인 넘버 : " + lineNo);
			System.out.println(appline.toString());
			String jsonObj = appline.getApproval();
			System.out.println("결재자 리스트 : "+appline.getApproval());

			JsonParser parse = new JsonParser();
			JsonElement element = parse.parse(jsonObj);

			int dataCNT = element.getAsJsonObject().get("APPROVAL").getAsJsonArray().size();
			System.out.println("data크기 : " + dataCNT);
			
			boolean flag = false;
			Approver approver = null;
			String approval = "{\"APPROVAL\":[";
			for (int i = 0; i < dataCNT; i++) {
				
				JsonObject temp = element.getAsJsonObject().get("APPROVAL").getAsJsonArray().get(i).getAsJsonObject();
//				JsonElement empJson1 = temp.get("emp_no");
//				JsonElement empJson2 = temp.get("approval_st");
//				JsonElement empJson3 = temp.get("reason");
//				JsonElement empJson4 = temp.get("approval_dt");
//				JsonElement empJson5 = temp.get("waiting");
//				
//				System.out.println("Json정보 : " +empJson1+", "+empJson2+", "+empJson3+", "+empJson4+", "+empJson5);
//
//				// 1은 세션에 있는 회원 번호
//				//JSONARRAY에서 결재자 회원번호와 로그인한 회원번호 동일시
//				if (empJson1.getAsInt() == 2) {
//
//					// APPROVAL[i].approval_st(승인여부) 값을 -> '승인'으로 변경
//					 approver = new Approver(empJson1.getAsInt(), // 결재자 회원번호
//							"승인", // 승인 여부
//							empJson3.getAsString(), // 반려 사유
//							nowTime, // 결재일
//							"n" // 대기 여부
//					);
//					flag = true; 
//					System.out.println("결재자 승인 업데이트");
//				
//				} else {
//					// 다음 결재자가 존재
//					if(flag) {
//						approver = new Approver(empJson1.getAsInt(), // 결재자 회원번호
//								empJson2.getAsString(), // 승인 여부
//								empJson3.getAsString(), // 반려 사유
//								empJson4.getAsString(), // 결재일 
//								"y" // 대기 여부
//							);	
//						flag = false;
//						System.out.println("다음결재자 에게 대기상태 넘김");
//					}else { // 다음 결재자가 존재 X
//					
//						 approver = new Approver(empJson1.getAsInt(), // 결재자 회원번호
//								empJson2.getAsString(), // 승인 여부
//								empJson3.getAsString(), // 반려 사유
//								empJson4.getAsString(), // 결재일 
//								empJson5.getAsString() // 대기 여부
//						);
//					}
//				}
				
				String appJson = gson.toJson(approver);
				System.out.println(appJson);
				
			
				
				//마지막 결재자일시
				if(i == dataCNT-1) {
					approval +=  appJson + "]}";
					
					appline.setApproval(approval);
					System.out.println("업데이트 된 결재자 리스트 : "+appline.getApproval());
				}else {
					approval += appJson + ",";
					System.out.println();
					System.out.println("변경후: " + approval);
					
				}
				
				System.out.println();
			
				
			} 
		
			//결재자 업데이트
			System.out.println(appline.toString());
			
			approvalServiceImpl.updateApproval(appline);


//{"APPROVER":[{"EMP_NO":"3", "APPROVAL_ST":"승인", "REASON":"", "APPROVAL_DT":"2021/12/16 11:49"},
//	         {"EMP_NO":"4","APPROVAL_ST":"승인", "REASON":"", "APPROVAL_DT":"2021/12/16 11:49"},
//	         {"EMP_NO":"2","APPROVAL_ST":"반려", "REASON":"##항목 누락됨", "APPROVAL_DT":"2021/12/16 11:49"},
//	         {"EMP_NO":"1","APPROVAL_ST":"", "REASON":"", "APPROVAL_DT": "2021/12/16 11:49"}]}
			// 문서 상태 완료로 변경
			// 문서 결재일 업데이트

//			Approval_Doc doc = new Approval_Doc();
//			doc.setApp_doc_no(docno);
//			doc.setApp_doc_st("완료");
//
//			System.out.println(doc.getApp_doc_no());
//			System.out.println(doc.getApp_doc_st());
//			approvalServiceImpl.updateDocSt(doc);

		
	}

}
