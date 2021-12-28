package com.min.edu.model.position;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.emp.Position;

@Service
public class PositionServiceImpl implements IPositionService{
	
	@Autowired
	private IPositionDao dao;

	@Override
	public List<Position> selectAllPosition() {
		return dao.selectAllPosition();
	}

}
