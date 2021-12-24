package com.min.edu.model.form;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.form.Form;
import com.min.edu.vo.form.FormClassification;
import com.min.edu.vo.paging.PagingDto;
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

	@Override
	public int insertForm(Form form) {
		logger.info("양식 등록 {}", form);
		return sqlSession.insert(NS+"insertForm", form);
	}

	@Override
	public List<Form> searchFormList(String formtitle) {
		logger.info("양식 검색 {}", formtitle);
		return sqlSession.selectList(NS+"searchForm", formtitle);
	}

	@Override
	public String selectTemplate(int form_no) {
		logger.info("양식 가져오기 {}", form_no);
		return sqlSession.selectOne(NS+"selectTemplate", form_no);
	}

	@Override
	public List<Form> selectForm() {
		logger.info("가져올 수 있는 양식 목록");
		return sqlSession.selectList(NS+"selectForm");
	}

	@Override
	public List<Form> selectPaging(PagingDto paging) {
		logger.info("페이징 처리하기");
		return sqlSession.selectList(NS+"selectPaging", paging);
	}

	@Override
	public int selectTotalPaging() {
		logger.info("전체 글 갯수 확인하기");
		return sqlSession.selectOne(NS+"selectTotalPaging");
	}

}
