package com.min.edu.model.form;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.form.Form;
import com.min.edu.vo.form.FormClassification;
@Repository
public class FormDaoImpl implements IFormDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.form.FormDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FormClassification> selectFormcList() {
		logger.info("전체 양식 분류 조회");
		return sqlSession.selectList(NS+"selectFormcList");
	}

	@Override
	public List<Form> selectFormList() {
		logger.info("전체 양식 리스트 조회");
		return sqlSession.selectList(NS+"selectFormList");
	}

	@Override
	public Form selectFormDetail(int form_no) {
		logger.info("양식 상세조회 {}", form_no);
		return sqlSession.selectOne(NS+"selectFormDetail", form_no);
	}

}
