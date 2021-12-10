package com.min.edu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.min.edu.model.INoticeService;
import com.min.edu.vo.NoticePageVO;
import com.min.edu.vo.NoticeVO;

@Controller
public class NoticeController {	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private INoticeService service;
	
	@GetMapping(value="/noticeList")
	public String getAllList(HttpServletRequest request) {
		String spageNo = request.getParameter("pageNo");
		int pageNo = 0;
		if(spageNo == null) {
			pageNo= 1;
		}else {
			pageNo= Integer.parseInt(spageNo);
		}
		
		String rowSize = request.getParameter("rowSize");
		if(rowSize==null) {
			rowSize= "10";
		}
		List<NoticeVO> cntlists = service.getAllList();
		NoticePageVO pg =
				new NoticePageVO(Integer.parseInt(rowSize), pageNo, cntlists.size());
		return null;
		
		/* List<NoticeVO> lists = service.getpage */
	}
}
