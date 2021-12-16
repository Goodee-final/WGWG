package com.min.edu.ctrl.emp;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.min.edu.model.emp.EmpServiceImpl;
import com.min.edu.model.emp.IEmpService;
import com.min.edu.vo.emp.Emp;

@Controller
public class EmpController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private Emp emp;
	
	@Autowired
	private IEmpService edao;
	
	@GetMapping(value="/insert_emp_form.do")
	public String insert_emp_form() {
		return "emp/insertEmp";
	}
	
	@GetMapping(value="/insert_emp.do")
	public String insert_emp(MultipartFile mfile, Model model) {
		
		logger.info("(｡･∀･)ﾉﾞ파일업로드 시작(｡･∀･)ﾉﾞ");
		
		
		String orgName = mfile.getOriginalFilename();
		
		String orgFileExtension = orgName.substring(orgName.lastIndexOf("."));
		
		String reName = UUID.randomUUID().toString().replaceAll("-", "")+orgFileExtension;
		
		logger.info(orgName);
		logger.info(reName);
		
		//파일 저장하는 폴더 위치 지정
		String path="C:\\eclipse\\workspace_Spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\img";
		
		String saveFileRoot = path+"\\"+reName;
		
		File saveFile = new File(saveFileRoot);
		
		logger.info(saveFile.getAbsolutePath());
		
		try {
			mfile.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		logger.info("\\(￣︶￣*\\)파일업로드 끝\\(￣︶￣*\\)");
		
		
		 
		 String name = (String) model.getAttribute("name"); 
		 int dept = (int)model.getAttribute("dept"); 
		 String hiredate = (String)model.getAttribute("hiredate"); 
		 String address = (String)model.getAttribute("address"); 
		 int position = (int)model.getAttribute("position"); 
		 String tel = (String)model.getAttribute("tel"); 
		 String email = (String)model.getAttribute("email");
		 String work_st = (String)model.getAttribute("work_st");
		 
		 emp.setEmp_nm(name); 
		 emp.setPhoto(saveFileRoot); 
		 emp.setDept_no(dept);
		 emp.setHiredate(hiredate); 
		 emp.setAddress(address);
		 emp.setPosition_no(position); 
		 emp.setTel(tel); 
		 emp.setEmail(email);
		 emp.setWork_st(work_st);
		 
		 edao.insert_emp(emp);
		 
		
		return "emp/insertResult";
	}
	
	
}
