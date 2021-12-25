package com.min.edu.ctrl.emp;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.min.edu.model.emp.IEmpService;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Emp_Page;
import com.min.edu.vo.emp.UploadFile;

@Controller
public class EmpController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	public Emp emp;
	
	@Autowired
	private IEmpService service;
	
	@GetMapping(value="/insert_emp_form.do")
	public String insert_emp_form(HttpServletRequest req) {
		return "emp/insertEmp";
	}
	
	@RequestMapping(value="/insert_emp.do",method=RequestMethod.POST)
	public String upload_img(UploadFile uploadFile, HttpServletRequest request, HttpServletRequest req, MultipartFile mfile) {
		//파일 서버에 업로드
		MultipartFile file = uploadFile.getFile();
		System.out.println("#####"+file);
				
		String fileName = file.getOriginalFilename();
		System.out.println("#####"+fileName);
				
		String orgFileExtension = fileName.substring(fileName.lastIndexOf("."));
		String reName = UUID.randomUUID().toString().replaceAll("-", "")+orgFileExtension;
				
		InputStream inputStream = null;
		OutputStream outputStream = null;
		OutputStream serverOutputStream = null;
				
		try {
			inputStream = file.getInputStream();
					
			String serverPath = WebUtils.getRealPath(request.getSession().getServletContext(), "/img/emp");
			String path = "C:\\Users\\ttiat\\git\\WGWG\\20211203_WGWG\\src\\main\\webapp\\img\\emp";
			//System.out.println("#####"+request.getSession().getServletContext());
			logger.info("##### 실제 업로드 될 경로 : "+serverPath);
			File storage = new File(serverPath);
			if(!storage.exists()) {
				storage.mkdirs();
			}
			
			File projectImg = new File(path);
			if(!projectImg.exists()) {
				projectImg.mkdirs();
			}
			
			String serverFilePath = serverPath+"/"+reName;
			String projectFilePath = path+"/"+reName;
				
			serverOutputStream = new FileOutputStream(serverFilePath);
			outputStream = new FileOutputStream(projectFilePath);
					
			int read = 0;
			byte[] n = new byte[(int)file.getSize()];
			while((read=inputStream.read(n)) != -1) {
				outputStream.write(n,0,read);
				serverOutputStream.write(n,0,read);
			}
					
			String name = req.getParameter("name"); 
			String pw = req.getParameter("pw");
			int dept = Integer.parseInt(req.getParameter("dept")); 
			String birth = req.getParameter("birth");
			String hiredate = req.getParameter("hiredate"); 
			String address = req.getParameter("address"); 
			int position = Integer.parseInt(req.getParameter("position")); 
			String tel = req.getParameter("tel"); 
			String email = req.getParameter("email");
			String work_st = req.getParameter("work_st");
			 
			emp.setEmp_nm(name); 
			emp.setPw(pw);
			emp.setPhoto(reName); 
			emp.setBirth(birth);
			emp.setDept_no(dept);
			emp.setHiredate(hiredate); 
			emp.setAddress(address);
			emp.setPosition_no(position); 
			emp.setTel(tel); 
			emp.setEmail(email);
			emp.setWork_st(work_st);

			service.insert_emp(emp);
			req.setAttribute("newEmp_no", emp.getEmp_no());
			Emp newEmp = service.selectInsertEmpInfo(emp.getEmp_no());
			req.setAttribute("newEmp", newEmp);
			
			logger.info("사원정보 업로드 완료 : {}",newEmp);
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				inputStream.close();
				outputStream.close();
				serverOutputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "emp/insertResult";
	}
	
	@GetMapping(value="/empList.do")
	public String selectAll(Model model,HttpServletRequest req) {
		logger.info("empList 사원 전체 조회 화면 이동");
		Emp_Page paging = new Emp_Page(
				req.getParameter("index"),
				req.getParameter("pageStartNum"),
				req.getParameter("listCnt"),
				req.getParameter("searchBy"),
				req.getParameter("searchWord")
				);
		logger.info("%%%%%%%%%%%%%%%%%%%%%%"+req.getParameter("searchBy")); //null
		logger.info("페이징 DTO 값 : {}",paging.toString());
		
		paging.setTotal(service.selectTotalPaging());
		List<Emp> lists = service.selectPaging(paging);
		
		model.addAttribute("empList",lists);
		model.addAttribute("paging",paging);
		logger.info("페이징 DTO 값 : {}",paging.toString());
		System.out.println(lists.toString());
		return "emp/empList";
	}
	
	@GetMapping(value="/updateEmpForm.do")
	public String updateEmpForm(HttpServletRequest req) {
		logger.info("EmpController 사원목록에서 상세정보페이지 이동");
		String emp_no = req.getParameter("emp_no");
		logger.info("Empcontroller 사원목록에서 받은 emp_no : ",emp_no);
		return "emp/updateEmpForm";
	}
}