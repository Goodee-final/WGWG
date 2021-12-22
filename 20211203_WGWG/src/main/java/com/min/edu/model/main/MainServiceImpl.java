package com.min.edu.model.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.notice.NoticeVO;

@Service
public class MainServiceImpl implements IMainService {

	@Autowired
	private IMainDao dao;
	
	@Override
	public List<NoticeVO> selectmainnotice() {
		return dao.selectmainnotice();
	}

}
