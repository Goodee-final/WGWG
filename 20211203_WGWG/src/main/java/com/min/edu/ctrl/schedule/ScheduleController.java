package com.min.edu.ctrl.schedule;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.edu.model.notice.INoticeService;
import com.min.edu.model.schedule.IServiceSchedule2;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.schedule.ScheduleVO;

@Controller
public class ScheduleController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IServiceSchedule2 service;
	
	@Autowired
	private INoticeService notservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/loadForm.do",method = RequestMethod.GET)
	public String calendarForm(HttpSession session) {
		logger.info("****NoticeController에 paging접속*****");
		int emp_no = (int) session.getAttribute("loginEmp");
		logger.info("세션으로 가져온 emp_no의 값{}",emp_no);
		Emp emp = notservice.selectEList(emp_no);
		logger.info("emp테이블에서 가져온 리스트의 값{}",emp);
		session.setAttribute("emp", emp);
		session.setAttribute("loc","./loadForm.do");
		return "schedule/Calendar";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/calendarlist.do",method = {RequestMethod.POST,RequestMethod.GET} ,produces = "application/text; charset=utf8")
	@ResponseBody	
	public String calendarlist (Model model,int emp_no) {
		//logger.info("************calendarlis 컨트롤러");		
		//logger.info("************calendarlis 컨트롤러{}",map.get("schedule_no"));	
		//List<ScheduleVO> lists = service.getAllPerList(Integer.parseInt(String.valueOf(map.get("schedule_no"))));
		
		//return lists;
		
		logger.info("****************list****************"+emp_no);

		JSONArray jlist = new JSONArray();
		ScheduleVO vo = null;
		
		List<ScheduleVO> lists = service.getAllPerList(emp_no);
		
		if (lists == null || lists.size() == 0) {
			logger.info("nothing found to load");
		}else {
			logger.info("lists 값:\t {}",lists);
			
			for (int i = 0; i < lists.size(); i++) {
				vo = lists.get(i);
				//logger.info("**********endday 테스트{}",vo.getSchedule_endday());
				//if (vo.getAllday().equals("true") && vo.getSchedule_startday() != vo.getSchedule_endday()) {
				//	vo.setSchedule_endday(vo.getSchedule_endday()+1);
				//}
				//logger.info("**********endday 테스트{}",vo.getSchedule_endday());
				JSONObject jdto = new JSONObject();				
				
				
				
				
				jdto.put("title", vo.getSchedule_title());
				jdto.put("start", vo.getSchedule_startday());
				jdto.put("end", vo.getSchedule_endday()); 							
				jdto.put("textColor", vo.getSchedule_tx_color());				
				jdto.put("backgroundColor", vo.getSchedule_bg_color());
				jdto.put("description", vo.getSchedule_content()); 				
				jdto.put("id", vo.getSchedule_no());
				jlist.add(jdto);		
		}
			logger.info("jlist??????????????????????: \t"+jlist.toString());
		}
		return jlist.toString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/calendarsave.do",method = RequestMethod.POST, produces = "applicaton/text; charset=UTF-8;")
	@ResponseBody
	public String save(ScheduleVO vo,int emp_no, String title,String start, String end,String textColor,String backgroundColor,String description,String chk) throws ParseException, java.text.ParseException {
		int cnt = 0;
		 
		String s[] = start.split("T");
		System.out.println(s[0]+" "+s[1]+":00");
		String e[] = end.split("T");
		System.out.println(e[0]+" "+e[1]+":00");
		
		vo.setSchedule_title(title);
		vo.setSchedule_startday(s[0]+" "+s[1]+":00");
		vo.setSchedule_endday(e[0]+" "+e[1]+":00");
		vo.setSchedule_tx_color(textColor);
		vo.setSchedule_bg_color(backgroundColor);
		vo.setSchedule_content(description);		
		vo.setEmp_no(emp_no);
		
		logger.info("vo 값은?????????????????????????????: \t"+vo);
		if(chk != null) {			
			cnt = service.insertScheduleC(vo);
		}else {
			cnt = service.insertScheduleP(vo);
		}
		
		System.out.println(cnt+"***************************************");
		
		if(cnt>0) {
			JSONObject json = new JSONObject();		
			json.put("title", vo.getSchedule_title());
			json.put("start", vo.getSchedule_startday());
			json.put("end", vo.getSchedule_endday()); 							
			json.put("textColor", vo.getSchedule_tx_color());				
			json.put("backgroundColor", vo.getSchedule_bg_color());
			json.put("description", vo.getSchedule_content()); 				
			json.put("id", vo.getSchedule_no());	
			logger.info(vo.getSchedule_content());   
			return json.toString();
		}else {
			return null;
		}
		
	}
	
	@RequestMapping(value = "/calendarupdate.do",method = RequestMethod.POST, produces = "applicaton/text; charset=UTF-8;")		
	@ResponseBody
	public String update(ScheduleVO vo,int emp_no, String title,String start, String end,String textColor,String backgroundColor,String description,int no,String chk) throws ParseException, java.text.ParseException {
		int cnt =0;
		 
		String s[] = start.split("T");
		System.out.println(s[0]+" "+s[1]+":00");
		String e[] = end.split("T");
		System.out.println(e[0]+" "+e[1]+":00");
		
		vo.setSchedule_title(title);
		vo.setSchedule_startday(s[0]+" "+s[1]+":00");
		vo.setSchedule_endday(e[0]+" "+e[1]+":00");
		vo.setSchedule_tx_color(textColor);
		vo.setSchedule_bg_color(backgroundColor);
		vo.setSchedule_content(description);		
		vo.setEmp_no(emp_no);
		vo.setSchedule_no(no);
		
		logger.info("vo 값은?????????????????????????????: \t"+vo);
		if(chk != null) {			
			cnt = service.updateScheduleC(vo);
		}else {
			cnt = service.updateScheduleP(vo);
		}
		
		System.out.println(cnt+"***************************************");
		
		
		if(cnt>0) {
			JSONObject json = new JSONObject();		
			
			return json.toString();
		}else {
			return null;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/calendardelete.do",method = RequestMethod.POST)
	@ResponseBody
	public String calendardelete(int no,String chk) {
		int cnt = 0;
		System.out.println(no);
		
		if(chk != null) {			
			cnt = service.deleteScheduleC(no);
		}else {
			cnt = service.deleteScheduleP(no);
		}
		
		System.out.println(cnt+"***************************************");
		
		if(cnt>0) {
			JSONObject jObj = new JSONObject();
						
			return jObj.toString();
		}else {
			return null;
		}
		
	}
	
	@GetMapping(value="/companyloadForm.do")
	public String companyloadForm(HttpSession session){
		logger.info("****NoticeController에 paging접속*****");
		int emp_no = (int) session.getAttribute("loginEmp");
		logger.info("세션으로 가져온 emp_no의 값{}",emp_no);
		Emp emp = notservice.selectEList(emp_no);
		logger.info("emp테이블에서 가져온 리스트의 값{}",emp);
		session.setAttribute("emp", emp);
		return "schedule/companyCalendar";
	}
	
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/calendarcompanylist.do",method = {RequestMethod.POST,RequestMethod.GET} ,produces = "application/text; charset=utf8")
	@ResponseBody	
	public String calendarcompanylist (Model model,HttpSession session) {
		//logger.info("************calendarlis 컨트롤러");		
		//logger.info("************calendarlis 컨트롤러{}",map.get("schedule_no"));	
		//List<ScheduleVO> lists = service.getAllPerList(Integer.parseInt(String.valueOf(map.get("schedule_no"))));
		
		//return lists;
		

		JSONArray jlist = new JSONArray();
		ScheduleVO vo = null;
		
		List<ScheduleVO> lists = service.getAllComList();
		
		if (lists == null || lists.size() == 0) {
			logger.info("nothing found to load");
		}else {
			logger.info("lists 값:\t {}",lists);
			
			for (int i = 0; i < lists.size(); i++) {
				vo = lists.get(i);
				//logger.info("**********endday 테스트{}",vo.getSchedule_endday());
				//if (vo.getAllday().equals("true") && vo.getSchedule_startday() != vo.getSchedule_endday()) {
				//	vo.setSchedule_endday(vo.getSchedule_endday()+1);
				//}
				//logger.info("**********endday 테스트{}",vo.getSchedule_endday());
				JSONObject jdto = new JSONObject();				
				
				
				
				
				jdto.put("title", vo.getSchedule_title());
				jdto.put("start", vo.getSchedule_startday());
				jdto.put("end", vo.getSchedule_endday()); 							
				jdto.put("textColor", vo.getSchedule_tx_color());				
				jdto.put("backgroundColor", vo.getSchedule_bg_color());
				jdto.put("description", vo.getSchedule_content()); 				
				jdto.put("id", vo.getSchedule_no());
				jlist.add(jdto);		
		}
			logger.info("jlist??????????????????????: \t"+jlist.toString());
		}
		return jlist.toString();
	}
	
	
	
}
