package com.min.edu.model.form;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.form.Form;
import com.min.edu.vo.form.FormClassification;
import com.min.edu.vo.paging.PagingDto;

@Service
public class FormServiceImpl implements IFormService {

	@Autowired
	private IFormDao dao;
	
	
	@Override
	public List<FormClassification> selectFormcList() {
		return dao.selectFormcList();
	}

	@Override
	public List<Form> selectFormList() {
		return dao.selectFormList();
	}

	@Override
	public Form selectFormDetail(int form_no) {
		return dao.selectFormDetail(form_no);
	}

	@Override
	public int insertForm(Map<String, Object> map) {
		return dao.insertForm(map);
	}

	@Override
	public List<Form> searchFormList(String formtitle) {
		return dao.searchFormList(formtitle);
	}

	@Override
	public String selectTemplate(int form_no) {
		return dao.selectTemplate(form_no);
	}

	@Override
	public List<Form> selectForm() {
		return dao.selectForm();
	}

	@Override
	public List<Form> selectPaging(PagingDto paging) {
		return dao.selectPaging(paging);
	}

	@Override
	public int selectTotalPaging() {
		return dao.selectTotalPaging();
	}

	@Override
	public List<Form> searchPaging(Map<String, Object> map) {
		return dao.searchPaging(map);
	}

	@Override
	public int searchTotalPaging(String formtitle) {
		return dao.searchTotalPaging(formtitle);
	}

}
