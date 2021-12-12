package com.min.edu.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.Sign;

@Repository
public class SignDaoImpl implements ISignDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.SignDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<Sign> selectSignList(int empno) {
		logger.info("회원의 전자서명 리스트 조회");
		return sqlSession.selectList(NS+"selectSignList", empno);
	}


	@Override
	public int insertSign(Sign sign) {
		logger.info("전자서명 등록");
		return sqlSession.insert(NS+"insertSign", sign);
		
	}
	


	@Override
	public int deleteSign(int sign) {
		logger.info("전자서명 삭제");
		return sqlSession.delete(NS+"deleteSign", sign);
	}


	@Override
	public Sign selectSignOne(int sign_no) {
		logger.info("전자서명 조회");
		return sqlSession.selectOne(NS+"selectSignOne", sign_no);
	}

}
