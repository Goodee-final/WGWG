package com.min.edu.model.form;

import java.util.List;

import com.min.edu.vo.form.Form;
import com.min.edu.vo.form.FormClassification;

public interface IFormDao {

	public List<FormClassification> selectFormcList();
	public List<Form> selectFormList();
	public Form selectFormDetail(int form_no);
	public int insertForm(Form form);
}
