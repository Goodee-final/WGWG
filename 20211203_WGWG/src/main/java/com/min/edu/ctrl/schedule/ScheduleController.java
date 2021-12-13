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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.edu.model.schedule.IServiceSchedule2;
import com.min.edu.vo.schedule.ScheduleVO;

@Controller
public class ScheduleController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private IServiceSchedule2 iService;
	
	@GetMapping(value="/loadForm.do")
	public String loadForm() {
		return "schedule/Calendar";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/load.do",method = RequestMethod.POST)
	@ResponseBody
	public String load(HttpSession session) throws ParseException{
		
		JSONArray jlist = new JSONArray();
		ScheduleVO vo = null;
		session.setAttribute("userid",3);
		int writer = (int) session.getAttribute("userid");
		List<ScheduleVO> lists = iService.getAllPerList(writer);
		
		if (lists == null || lists.size() == 0) {
			logger.info("nothing found to load");
		}else {
			logger.info("lists 값:\t {}",lists);
			
			for (int i = 0; i < lists.size(); i++) {
				vo = lists.get(i);
				JSONObject jdto = new JSONObject();
				
				jdto.put("scheduletitle", vo.getSchedule_title());
				jdto.put("start",vo.getSchedule_startday());  
				jdto.put("end",vo.getSchedule_endday());      
				jdto.put("allday",vo.getAllday()); 
				jdto.put("empno",vo.getEmp_no()); 
				jlist.add(jdto);		
		}
			logger.info("jlist??????????????????????: \t"+jlist.toString());
		}
		return jlist.toString();
	}

}
