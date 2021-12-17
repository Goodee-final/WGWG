package com.min.edu.model.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.notice.NoticeFileVO;
import com.min.edu.vo.notice.NoticePageVO;
import com.min.edu.vo.notice.NoticeVO;

@Repository
public class NoticeDaoImpl implements INoticeDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.notice.NoticeDaoImpl.";
		
	@Autowired
	private SqlSessionTemplate sqlSession;		
	
	
	@Override
	public int insertFile(NoticeFileVO vo) {
		logger.info("공지사항 insertFile {}",vo);
		return sqlSession.insert(NS+"insertFile",vo);
	}

	@Override
	public NoticeVO getBoard(int notice_no) {
		logger.info("공지사항 getBoard {}",notice_no);
		return sqlSession.selectOne(NS+"getBoard",notice_no);
	}

	@Override
	public NoticeFileVO getFile(int notice_file_no) {
		logger.info("공지사항 getFile {}",notice_file_no);
		return sqlSession.selectOne(NS+"getFile",notice_file_no);
	}

	
	@Override
	public int countNoticechk(String notice_chk) {
		logger.info("공지사항 countNoticechk {}",notice_chk);
		return sqlSession.selectOne(NS+"countNoticechk",notice_chk);
	}	
	 	 
	@Override
	public int insertNotice(NoticeVO vo) {
		logger.info("공지사항 insertNotice {}",vo);
		return sqlSession.insert(NS+"insertNotice",vo);
	}

	@Override
	public NoticeVO detailNotice(int notice_no) {
		logger.info("공지사항 detailNotice {}",notice_no);
		return sqlSession.selectOne(NS+"detailNotice",notice_no);
	}

	@Override
	public int updatecnt(int notice_no) {
		logger.info("공지사항 조회수 증가 +1 updatecnt {}",notice_no);
		return sqlSession.update(NS+"updatecnt",notice_no);
	}
	 @Override
	 public List<NoticeVO> selectNotchk(NoticePageVO vo) {
		logger.info("공지사항 selectNotchk {}",vo); 
		return  sqlSession.selectList(NS+"selectNotchk",vo); 
	 }	
	 	
	@Override
	public int updateNotice(NoticeVO vo) {
		logger.info("공지사항 updateBoard {}",vo);
		return sqlSession.update(NS+"updateNotice",vo);
	}

	@Override
	public int updateFile(NoticeFileVO vo) {
		logger.info("공지사항 updateBoard {}",vo);
		return sqlSession.update(NS+"updateFile",vo);
	}

	@Override
	public int deleteNotice(int notice_no) {
		logger.info("공지사항 글삭제 deleteNotice {}",notice_no);
		return sqlSession.delete(NS+"deleteNotice",notice_no);
	}

	@Override
	public int deleteNoticeFile(int notice_no) {
		logger.info("공지사항 파일삭제deleteNotice {}",notice_no);
		return sqlSession.delete(NS+"deleteNoticeFile",notice_no);
	}
	
	@Override
	public List<NoticeVO> selectPaging(NoticePageVO paging) {		
		logger.info("공지사항 페이징 selectPaging {}",paging);
		return sqlSession.selectList(NS+"selectPaging",paging);
	}

	@Override
	public int selectTotalPaging() {
		logger.info("공지사항 총 갯수 selectTotalPaging");
		return sqlSession.selectOne(NS+"selectTotalPaging");
	}

	@Override
	public int insertNoticeCompany(NoticeVO vo) {
		logger.info("공지사항 회사글 등록 insertNoticeCompany {}",vo);
		return sqlSession.insert(NS+"insertNoticeCompany",vo);
	}

	

	


}
