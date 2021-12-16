package com.min.edu.ctrl.emp;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.min.edu.model.emp.IEmpService;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.UploadFile;

@Controller
public class EmpController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	public Emp emp;
	
	@Autowired
	private IEmpService service;

	
	@GetMapping(value="/insert_emp_form.do")
	public String insert_emp_form() {
		return "emp/insertEmp";
	}
	
	@RequestMapping(value="/insert_emp.do",method=RequestMethod.POST)
	public String upload_img(UploadFile uploadFile, HttpServletRequest request, HttpServletRequest req) {
		//파일 받아오기
		MultipartFile file = uploadFile.getFile();
		System.out.println("#####"+file);
		
		String fileName = file.getOriginalFilename();
		System.out.println("#####"+fileName);
		
		String orgFileExtension = fileName.substring(fileName.lastIndexOf("."));
        String reName = UUID.randomUUID().toString().replaceAll("-", "")+orgFileExtension;
		
		//물리적인 파일을 저장한다
		//파일을 서버(절대경로/상대경로) IO로 업로드
		//문서 타입이 뭔지 모르는 상태임. InputStream은 다 0101로 쪼갠다
		InputStream inputStream = null; //초기화
		OutputStream outputStream = null;
		
		try {
			//1. 파일을 읽는다 : file.getInputStream() - 파일만 읽음
			inputStream = file.getInputStream();
			
			//2. 저장 위치를 만든다(없으면 만들어주고 있으면 사용.)
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/storage");
			System.out.println("#####"+request.getSession().getServletContext());
			System.out.println("##### 실제 업로드 될 경로 : "+path);
			
			//만약 저장 위치가 없다면?
			File storage = new File(path);
			if(!storage.exists()) {
				storage.mkdirs();
			}
			
			//저장할 파일이 없다면 만들어 주고 override한다.
			//파일이 있어야 저장이 된다
			String filePath = path+"/"+reName;
			
			File newfile = new File(path+"/"+reName);
			if(!newfile.exists()) {
				newfile.createNewFile();
			}
			
			//파일을 쓸 위치를 지정한다
			outputStream = new FileOutputStream(newfile);
			
			//3. 파일을 쓴다
			int read = 0;
			byte[] n = new byte[(int)file.getSize()];
			while((read=inputStream.read(n)) != -1) {
				outputStream.write(n,0,read);
			}
			
			String name = req.getParameter("name"); 
			int dept = Integer.parseInt(req.getParameter("dept")); 
			String birth = req.getParameter("birth");
			String hiredate = req.getParameter("hiredate"); 
			String address = req.getParameter("address"); 
			int position = Integer.parseInt(req.getParameter("position")); 
			String tel = req.getParameter("tel"); 
			String email = req.getParameter("email");
			String work_st = req.getParameter("work_st");
			 
			 emp.setEmp_nm(name); 
			 emp.setPhoto(filePath); 
			 emp.setBirth(birth);
			 emp.setDept_no(dept);
			 emp.setHiredate(hiredate); 
			 emp.setAddress(address);
			 emp.setPosition_no(position); 
			 emp.setTel(tel); 
			 emp.setEmail(email);
			 emp.setWork_st(work_st);
			 
			 int newEmpno = service.insert_emp(emp);
			 
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
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
		 
		service.insert_emp(emp);
		 
		
		return "emp/insertResult";
	}
}
	
	

