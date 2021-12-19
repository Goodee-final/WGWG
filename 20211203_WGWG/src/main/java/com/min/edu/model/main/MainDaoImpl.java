package com.min.edu.model.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.notice.NoticeVO;

@Repository
public class MainDaoImpl implements IMainDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.main.MainDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticeVO> selectmainnotice() {
		logger.info("main에서 가져오는 공지사항 리스트");
		return sqlSession.selectList(NS+"selectmainnotice");
	}

}
