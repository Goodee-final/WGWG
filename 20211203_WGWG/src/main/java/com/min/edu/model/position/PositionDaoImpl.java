package com.min.edu.model.position;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.emp.Position;

@Repository
public class PositionDaoImpl implements IPositionDao{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final String NS = "com.min.edu.model.position.PositionDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Position> selectAllPosition() {
		logger.info("PositionDaoImpl selectAllPosition");
		return sqlSession.selectList(NS+"selectAllPosition");
	}

}
