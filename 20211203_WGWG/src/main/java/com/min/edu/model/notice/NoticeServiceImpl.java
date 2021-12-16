package com.min.edu.model.notice;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.min.edu.vo.notice.NoticeFileVO;
import com.min.edu.vo.notice.NoticePageVO;
import com.min.edu.vo.notice.NoticeVO;

@Service
public class NoticeServiceImpl implements INoticeService{
	
	@Autowired
	private INoticeDao dao;	
	
	@Override
	public int insertFile(NoticeFileVO vo) {		
		return dao.insertFile(vo);
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
	public int countNoticechk(String notice_chk) {
		return dao.countNoticechk(notice_chk);
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
	public int updatecnt(int notice_no) {
		return dao.updatecnt(notice_no);
	}
	
	@Override
	public List<NoticeVO> selectNotchk(NoticePageVO vo) {
		return dao.selectNotchk(vo);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return dao.updateNotice(vo);
	}
	
	@Override
	public int updateFile(NoticeFileVO vo) {
		return dao.updateFile(vo);
	}

	
	@Override
	public int deleteNotice(int notice_no) {
		return dao.deleteNotice(notice_no);
	}

	@Override
	public int deleteNoticeFile(int notice_no) {		
		return dao.deleteNoticeFile(notice_no);
	}
	
	@Override
	public int deleteNF(int notice_no) {
		int m = dao.deleteNoticeFile(notice_no);
		int n = dao.deleteNotice(notice_no);		
		return n+m;
	}
	@Override
	public List<NoticeVO> selectPaging(NoticePageVO paging) {		
		return dao.selectPaging(paging);
	}

	@Override
	public int selectTotalPaging() { 
		return dao.selectTotalPaging();
	}

	
}
