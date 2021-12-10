package com.min.edu.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.NoticeVO;

@Repository
public class NoticeDaoImpl implements INoticeDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.NoticeDaoImpl.";
		
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	@Override
	public List<NoticeVO> getAllList() {
		logger.info("공지사항 getAllList ");
		return sqlSession.selectList(NS+"getAllList");
	}

}
