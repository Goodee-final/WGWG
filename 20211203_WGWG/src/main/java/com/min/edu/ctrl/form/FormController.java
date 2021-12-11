package com.min.edu.ctrl.form;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.edu.model.form.IFormDao;
import com.min.edu.vo.Form;


@Controller
public class FormController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IFormDao dao;
	
	@RequestMapping(value="/formlist.do", method=RequestMethod.GET)
	public String formList(Model model){
		logger.info("양식 리스트 화면 이동");
		List<Form> formList = dao.selectFormList();
		model.addAttribute("formList",formList);
		return "./form/formlist";
	}
	
	@RequestMapping(value="/formdetail.do", method=RequestMethod.GET)
	public String formDetail(Model model, int form_no) {
		logger.info("양식 상세화면 이동");
		logger.info("전달받은 양식번호 {}", form_no);
		Form selectForm = dao.selectFormDetail(form_no);
		model.addAttribute("selectForm",selectForm);
		return "./form/formdetail";
	}
}
