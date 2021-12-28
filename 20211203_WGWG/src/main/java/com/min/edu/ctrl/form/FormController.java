package com.min.edu.ctrl.form;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.edu.model.form.IFormService;
import com.min.edu.vo.form.Form;
import com.min.edu.vo.form.FormClassification;
import com.min.edu.vo.paging.PagingDto;


@Controller
public class FormController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IFormService service;
	
	
	@RequestMapping(value="/formlist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String formList(Model model, HttpServletRequest req){
		logger.info("양식 리스트 화면 이동");
	  	List<Form> formList = service.selectFormList();
	
	  	model.addAttribute("formList", formList);
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
		logger.info("양식내용 {}", content);
		logger.info("양식사이즈 {}", content.length());
		
		List<String> longtemp = new ArrayList<String>();
		int cnt =  content.length()/3500;
		if(content.length()%3500 != 0) {
			cnt ++;
		}
		int i;
		for (i = 0; i < cnt-1; i++) {
			longtemp.add(content.substring(i*3500, (i+1)*3500)) ;
		}
		
		longtemp.add(content.substring(i*3500)) ;
//		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("form_nm", title);
		map.put("form_class_no", formclassification);
		map.put("template", longtemp);
		
		int insert = service.insertForm(map);
		if(insert > 0) {
			return "redirect:/home.do";
		} else {
			return "redirect:/insertform.do";
		}
	}
	
	@RequestMapping(value="/formsearch.do", method=RequestMethod.POST)
	public String formSearch(@RequestParam String formtitle, Model model, HttpServletRequest req) {
		System.out.println(formtitle);
		List<Form> formList = service.searchFormList(formtitle);
		model.addAttribute("formList",formList);
		return "/form/formlist";
	}
	
	@RequestMapping(value="/formselect.do", method=RequestMethod.GET, produces ="application/text; charset=UTF-8")
	@ResponseBody
	public String formTemplate(@RequestParam int form_no, Model model, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		logger.info("폼 양식 가져오기 {}", form_no);
		System.out.println(form_no);
		String template = service.selectTemplate(form_no);
		System.out.println(template);
		return template;
		
	}
}
