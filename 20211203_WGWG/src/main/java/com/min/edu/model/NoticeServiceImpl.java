package com.min.edu.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements INoticeService{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private INoticeDao dao;

	@Override
	public List<NoticeVO> getAllList() {		
		return dao.getAllList();
	}
	
}
