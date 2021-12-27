package com.min.edu.ctrl.emp;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.min.edu.ctrl.sign.MediaUtils;
import com.min.edu.model.department.IDeptService;
import com.min.edu.model.emp.IEmpService;
import com.min.edu.model.position.IPositionService;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Emp_Page;
import com.min.edu.vo.emp.Position;
import com.min.edu.vo.emp.UploadFile;
import com.min.edu.vo.sign.Sign;

@Controller
public class EmpController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	public Emp emp;
	
	@Autowired
	private IEmpService service;
	
	@Autowired
	private IDeptService dservice;
	
	@Autowired
	private IPositionService pservice;
	
	@GetMapping(value="/insert_emp_form.do")
	public String insert_emp_form(HttpServletRequest req) {
		
		//전체 부서 select
		List<Department> dList = dservice.selectAllDept();
		req.setAttribute("deptList", dList);
		
		//전체 직급 select
		List<Position> pList = pservice.selectAllPosition();
		req.setAttribute("positionList", pList);
		
		
		
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
		int emp_no =  Integer.parseInt(req.getParameter("emp_no"));
		logger.info("Empcontroller 사원목록에서 받은 emp_no : {}",emp_no);
		
		//해당 사원 정보
		Emp selectedEmp = service.selectEmpByNo(emp_no);
		logger.info("Empcontroller selectEmpByNo 선택된 사원 정보 : {}",selectedEmp);
		req.setAttribute("selectedEmp", selectedEmp);
		
		//전체 부서 select
		List<Department> dList = dservice.selectAllDept();
		logger.info("Empcontroller selectDeptAll : {}",dList);
		req.setAttribute("deptList", dList);
		
		//전체 직급 select
		List<Position> pList = pservice.selectAllPosition();
		logger.info("Empcontroller selectAllPosition : {}",pList);
		req.setAttribute("positionList", pList);
		
		return "emp/updateEmpForm";
	}
	
	@PostMapping(value="/updateEmp.do")
	public String updateEmp(HttpServletRequest req, Model model, HttpSession session) {
		logger.info("Empcontroller updateEmp 인사팀 정보 수정");
		int updateDept = Integer.parseInt(req.getParameter("dept_no"));
		String updateEmp_nm = req.getParameter("emp_nm");
		int updatePosition = Integer.parseInt(req.getParameter("position_no"));
		String updateWork_st = req.getParameter("work_st");
		int updateEmp_no = Integer.parseInt(req.getParameter("emp_no"));
		
		emp.setDept_no(updateDept);
		emp.setEmp_nm(updateEmp_nm);
		emp.setPosition_no(updatePosition);
		emp.setWork_st(updateWork_st);
		emp.setEmp_no(updateEmp_no);
		
		logger.info("Empcontroller updateEmp 인사팀 정보수정 : {}",emp);
		
		service.updateEmp(emp);
		session.setAttribute("loc", "./empList.do");
		return "redirect:/home.do";
		
	}
	
	@GetMapping(value="/chkPWForm.do")
	public String checkPWForm(HttpServletResponse resp) throws IOException {
		return"emp/checkPW";
	}
	
	@PostMapping(value="/chkPW.do")
	public String checkPw(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		logger.info("Empcontroller checkPw 비밀번호 확인 페이지 이동");
		int emp_no = (int) session.getAttribute("loginEmp");
		String getpw = service.getSessionPW(emp_no);
		logger.info("Empcontroller getSessionPW 세션에서 가져온 비밀번호 : {}",getpw);
		req.setAttribute("chkPw", getpw);
		String inputpw = req.getParameter("inputpw");
		logger.info("Empcontroller 화면에서 받아온 비밀번호 : {}",inputpw);
		if(getpw.equals(inputpw)) {
			
			session.setAttribute("loc", "./myPageForm.do");
			return "redirect:/home.do";
		}else{
			req.setAttribute("message", "비밀번호를 확인해주세요.");
			session.setAttribute("loc", "./chkPWForm.do");
			return "redirect:/home.do";
		}
	}
	
	@GetMapping(value="/myPageForm.do")
	public String myPageForm(HttpSession session,HttpServletRequest req) {
		//해당 사원 정보
		int emp_no = (int) session.getAttribute("loginEmp");
		Emp selectedEmp = service.selectMyPage(emp_no);
		logger.info("Empcontroller selectEmpByNo 선택된 사원 정보 : {}",selectedEmp);
		req.setAttribute("selectedEmp", selectedEmp);
		session.setAttribute("loc", "./myPageForm.do");
		return "emp/myPage";
	}
	
	@GetMapping(value="/myPageUpdate.do")
	public String myPageUpdate() {
		
		return null;
	}
	
	@GetMapping(value="/changePwForm.do")
	public String changePwForm() {
		return "emp/changePwForm";
	}
	
	@GetMapping(value="/checkPrePW.do")
	public String checkPrePW(HttpServletRequest req,HttpSession session) {
		int emp_no = (int) session.getAttribute("loginEmp");
		String getpw = service.getSessionPW(emp_no);
		req.setAttribute("getpw", getpw);
		String inputpw = req.getParameter("password");
		if(getpw.equals(inputpw)) {
			return "emp/realChangePw";
		}else {
			req.setAttribute("message", "비밀번호를 확인해 주세요.");
			return "emp/changePwForm";
		}
	}

	
	@PostMapping(value="/updateMyPage.do")
	public String updateMyPage(UploadFile uploadFile, HttpServletRequest req, MultipartFile mfile, HttpSession session) throws FileNotFoundException {
		
		String serverPath = WebUtils.getRealPath(req.getSession().getServletContext(), "/img/emp");
		String path = "C:\\Users\\ttiat\\git\\WGWG\\20211203_WGWG\\src\\main\\webapp\\img\\emp";
		
		//DB에서 가져온 파일명
		Emp emp = service.selectEmpByNo(Integer.parseInt(req.getParameter("empno")));
		String photoName = emp.getPhoto();
		logger.info("update file: " + photoName);
		
		MultipartFile file = uploadFile.getFile();
		System.out.println("#####"+file);
				
		String fileName = file.getOriginalFilename();
		System.out.println("#####"+fileName);
		
		//파일이 없다면
		if(fileName == null || fileName == "") {
			String pw = req.getParameter("password");
			String addr = req.getParameter("address");
			String tel = req.getParameter("tel");
			String email = req.getParameter("email");
			
			emp.setPw(pw);
			emp.setAddress(addr);
			emp.setTel(tel);
			emp.setEmail(email);
			
			service.updateMyPage_NoPhoto(emp);
			session.setAttribute("loc", "./main.do");
			return "redirect:/home.do";
					
			
		//파일이 있다면
		}else {
			//기존 파일 삭제
			new File(serverPath +'/'+ photoName).delete();
			new File(path +'/'+ photoName).delete();
			
			//새로운 파일 업로드
			String orgFileExtension = fileName.substring(fileName.lastIndexOf("."));
			String reName = UUID.randomUUID().toString().replaceAll("-", "")+orgFileExtension;
					
			InputStream inputStream = null;
			OutputStream outputStream = null;
			OutputStream serverOutputStream = null;
					
			try {
					inputStream = file.getInputStream();
							
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
			
				 
				String pw = req.getParameter("password");
				String addr = req.getParameter("address");
				String tel = req.getParameter("tel");
				String email = req.getParameter("email");
				
				emp.setPhoto(reName);
				emp.setPw(pw);
				emp.setAddress(addr);
				emp.setTel(tel);
				emp.setEmail(email);
				
				service.updateMyPage(emp);
				
		}catch (IOException e) {
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
			session.setAttribute("loc", "./main.do");
			return "redirect:/home.do";
		}
	}
}

