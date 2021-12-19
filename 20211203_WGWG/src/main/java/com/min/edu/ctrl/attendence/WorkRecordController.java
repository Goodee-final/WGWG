package com.min.edu.ctrl.attendence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.edu.model.attendence.IWorkRecordService;
import com.min.edu.vo.attendence.WorkRecord;

@Controller
public class WorkRecordController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IWorkRecordService service;
	
	@RequestMapping(value="/workrecord.do", method = RequestMethod.GET)
	public String workRecordForm(Model model) {
		logger.info("근태 화면 이동");
		WorkRecord record = service.selectwr(6);
		model.addAttribute("record", record);
		return "attendence/work";
	}
}
