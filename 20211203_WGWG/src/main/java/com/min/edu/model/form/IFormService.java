package com.min.edu.model.form;

import java.util.List;

import com.min.edu.vo.Form;
import com.min.edu.vo.FormClassification;

public interface IFormService {

	public List<FormClassification> selectFormcList();
	public List<Form> selectFormList();
	public Form selectFormDetail(int form_no);
}
