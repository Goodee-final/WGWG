package com.min.edu.ctrl.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.vo.notice.NoticeVO;
import com.min.edu.vo.paging.PageVO;
import com.min.edu.model.notice.INoticeService;

@Controller
public class NoticeController {	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private INoticeService service;	
	
	@RequestMapping(value ="/noticeList.do" , method = {RequestMethod.POST,RequestMethod.GET})
	  public String paging(Model model,HttpServletRequest request) {
		PageVO paging = new PageVO(
	               request.getParameter("index"),
	               request.getParameter("pageStartNum"),
	               request.getParameter("listCnt")
	            );
	      
	      paging.setTotal(service.selectTotalPaging());
	      List<NoticeVO> lists = service.selectPaging(paging);
	      
	      model.addAttribute("lists",lists);
	      model.addAttribute("paging", paging);
	      logger.info("페이징 DTO 값 :{}",paging.toString());
	      return "notice/noticeList";
	   }
	/*
	@GetMapping(value="/noticeList.do")
	public String getAllList(PageVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage 
			, @RequestParam(value="notice_chk", required=false)String notice_chk) {
		
		logger.info("getAllList Controller 진입");
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}	
		logger.info(" notice_chk (☞ﾟヮﾟ)☞☜(ﾟヮﾟ☜)"+notice_chk);
		if(notice_chk == null ||  notice_chk.equals("모두보기")) {
			notice_chk = "모두보기";  // -->나중에 '회사'로 변경 
			int total = service.countNotice();
			vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),notice_chk);
			model.addAttribute("paging", vo);	
			model.addAttribute("viewAll", service.selectNotice(vo));
		}else {
			int total = service.countNoticechk(notice_chk);
			logger.info(" total (☞ﾟヮﾟ)☞☜(ﾟヮﾟ☜)"+total);
			vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),notice_chk);
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", service.selectNotchk(vo));
		}
		
		return "notice/notice";
	}	
	*/
	
	@GetMapping(value="/noticeInsertForm.do")
	public String noticeInsertForm() {		
		return "notice/noticeInsert";
	}
	
	@PostMapping(value="/noticeInsert.do")
	public String insertNotice(NoticeVO vo) {
		int cnt = service.insertNotice(vo);
		logger.info("insertNotice {} ",cnt);
		return "redirect:/noticeList.do";
	}
	
	@GetMapping("/detailnotice.do")
	public String viewDetail(Model model, 
	                        @RequestParam("notice_no")int notice_no) {
	  NoticeVO vo =  service.detailNotice(notice_no);
	  model.addAttribute("vo",vo);

	  return "notice/detailnotice";
	}
	
	@GetMapping("/noticeupdate.do")
	public String modify(@RequestParam("notice_no")int notice_no, Model model) {
		model.addAttribute("vo", service.detailNotice(notice_no));
		return "notice/noticeupdate";
	}

	@PostMapping("/noticeupdate.do")
	public String modify(NoticeVO vo) {
		service.updateNotice(vo);
		return "redirect:/detailnotice.do?notice_no="+ vo.getNotice_no();
	}
	
	@GetMapping("/noticedelete.do")
	public String delete(@RequestParam("notice_no")int notice_no) {
		service.deleteNotice(notice_no);
		return "redirect:/noticeList.do";
	}
}
