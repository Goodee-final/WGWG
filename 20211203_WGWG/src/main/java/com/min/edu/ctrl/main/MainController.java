package com.min.edu.ctrl.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.edu.model.emp.IEmpService;
import com.min.edu.model.main.IMainService;
import com.min.edu.vo.notice.NoticeVO;

@Controller
public class MainController {

	@Autowired
	private IEmpService empService;
	
	@Autowired
	private IMainService mainService;
	
	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public String home(Model model) {
		//테스트할 때 index페이지부터 보여주기 위한 주소
		List<NoticeVO> noticeList = mainService.selectmainnotice();
		model.addAttribute("noticeList", noticeList);
		return "index";
	}
}
