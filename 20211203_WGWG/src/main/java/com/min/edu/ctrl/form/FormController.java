package com.min.edu.ctrl.form;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.model.form.IFormService;
import com.min.edu.vo.form.Form;
import com.min.edu.vo.form.FormClassification;


@Controller
public class FormController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IFormService service;
	
	
	@RequestMapping(value="/formlist.do", method=RequestMethod.GET)
	public String formList(Model model){
		logger.info("양식 리스트 화면 이동");
		List<Form> formList = service.selectFormList();
		model.addAttribute("formList",formList);
		return "/form/formlist";
	}
	
	@RequestMapping(value="/formdetail.do", method=RequestMethod.GET)
	public String formDetail(Model model, int form_no) {
		logger.info("양식 상세화면 이동");
		logger.info("전달받은 양식번호 {}", form_no);
		Form selectForm = service.selectFormDetail(form_no);
		model.addAttribute("selectForm",selectForm);
		return "/form/formdetail";
	}
	
	@RequestMapping(value="/forminsert.do", method=RequestMethod.GET)
	public String formInsertForm(Model model) {
		logger.info("양식 등록화면 이동");
		List<FormClassification> fclist = service.selectFormcList();
		model.addAttribute("fclist", fclist);
		logger.info("크기 {}", fclist.size());
		return "/form/forminsert";
	}
	
	@RequestMapping(value="/insertform.do", method=RequestMethod.POST)
	public String formInsert(@RequestParam String content, @RequestParam int formclassification, @RequestParam String title) {
		System.out.println(content);
		System.out.println(formclassification);
		System.out.println(title);
		Form form = new Form(title, content, formclassification);
		int cnt = service.insertForm(form);
//		if(cnt > 0) {
//			return "/formlist.do";
//		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/formsearch.do", method=RequestMethod.POST)
	public String formSearch(String formtitle, Model model) {
		System.out.println(formtitle);
		List<Form> formList = service.searchFormList(formtitle);
		model.addAttribute("formList",formList);
		return "/form/formlist";
	}
}
