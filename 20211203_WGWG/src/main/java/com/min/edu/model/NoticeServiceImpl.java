package com.min.edu.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.NoticeFileVO;
import com.min.edu.vo.PageVO;
import com.min.edu.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements INoticeService{
	

	@Autowired
	private INoticeDao dao;

	@Override
	public List<NoticeVO> getAllList() {		
		return dao.getAllList();
	}

	@Override
	public int insertBoardF(NoticeVO nvo,NoticeFileVO fvo) {		
		int count = 0;
		count += dao.insertBoard(nvo);
		if(fvo !=null) {
			count+=  dao.insertFile(fvo);
		}
		return count;
	}

	@Override
	public NoticeVO getBoard(int notice_no) {		
		return dao.getBoard(notice_no);
	}

	@Override
	public NoticeFileVO getFile(int notice_file_no) {		
		return dao.getFile(notice_file_no);
	}

	@Override
	public int countNotice() {
		return dao.countNotice();
	}
	
	@Override
	public int countNoticechk(String notice_chk) {
		return dao.countNoticechk(notice_chk);
	}
	
	@Override
	public List<NoticeVO> selectNotice(PageVO vo) {
		return dao.selectNotice(vo);
	}

	@Override
	public int insertNotice(NoticeVO vo) {		
		return dao.insertNotice(vo);
	}

	@Override
	public NoticeVO detailNotice(int notice_no) {
		return dao.detailNotice(notice_no);
	}

	@Override
	public List<NoticeVO> selectNotchk(PageVO vo) {
		return dao.selectNotchk(vo);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return dao.updateNotice(vo);
	}
	
	@Override
	public int deleteNotice(int notice_no) {
		return dao.deleteNotice(notice_no);
	}

	@Override
	public List<NoticeVO> selectPaging(PageVO paging) {		
		return dao.selectPaging(paging);
	}

	@Override
	public int selectTotalPaging() { 
		return dao.selectTotalPaging();
	}

	

	

	
}
