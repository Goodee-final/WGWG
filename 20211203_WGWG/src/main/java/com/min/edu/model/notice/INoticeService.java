package com.min.edu.model.notice;

import java.util.List;

import com.min.edu.vo.notice.NoticeFileVO;
import com.min.edu.vo.notice.NoticePageVO;
import com.min.edu.vo.notice.NoticeVO;

public interface INoticeService {
	
	//파일 등록
		public int insertFile(NoticeFileVO vo);
		//공지사항 상세조회(파일글이름,저장이름+공지사항)
		public NoticeVO getBoard(int notice_no);	
		//공지사항 파일 검색
		public NoticeFileVO getFile(int notice_file_no);
		//공지사항 등록
		public int insertNotice(NoticeVO vo);
		//공지사항 상세조회
		public NoticeVO detailNotice(int notice_no);	
		//공지사항 조회수 +1
		public int updatecnt(int notice_no);
		
		//공지사항 업데이트
		public int updateNotice(NoticeVO vo);
		//파일 업데이트
		public int updateFile(NoticeFileVO vo);
		//공지사항 삭제
		public int deleteNotice(int notice_no);
		//파일삭제
		public int deleteNoticeFile(int notice_no);
		//페이징처리 모두검색
		public List<NoticeVO> selectPaging(NoticePageVO paging);
		public int selectTotalPaging();
		//부서별 페이징 처리
		public List<NoticeVO> selectNotchk(NoticePageVO vo);
		public int countNoticechk(String notice_chk);	
		
		//공지사항,파일 둘다삭제
		public int deleteNF(int notice_no);
		
		
		
		
	
}
