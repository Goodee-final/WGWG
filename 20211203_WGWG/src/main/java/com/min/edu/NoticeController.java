package com.min.edu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.model.INoticeService;
import com.min.edu.vo.NoticePageVO;
import com.min.edu.vo.NoticeVO;

@Controller
public class NoticeController {	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private INoticeService service;
	
	@GetMapping(value="/noticeList.do")
	public String getAllList(NoticePageVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = service.countNotice();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new NoticePageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", service.selectNotice(vo));
		return "notice/notice";
	}
}
