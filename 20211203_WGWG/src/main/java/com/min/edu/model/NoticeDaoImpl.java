package com.min.edu.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.NoticeFileVO;
import com.min.edu.vo.NoticePageVO;
import com.min.edu.vo.NoticeVO;

@Repository
public class NoticeDaoImpl implements INoticeDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.NoticeDaoImpl.";
		
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	private static NoticeDaoImpl single;
	
	private NoticeDaoImpl() {}
	
	public static NoticeDaoImpl getInstance() {
		if(single==null) {
			single = new NoticeDaoImpl();
		}
		return single;
	}
	
	@Override
	public List<NoticeVO> getAllList() {
		logger.info("공지사항 getAllList ");
		return sqlSession.selectList(NS+"getAllList");
	}

	@Override
	public int insertBoard(NoticeVO vo) {
		logger.info("공지사항 insertBoard {} ",vo);
		return sqlSession.insert(NS+"insertBoard",vo);
	}

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
	public int countNotice() {
		logger.info("공지사항 countBoard {}");
		return sqlSession.selectOne(NS+"countNotice");
	}

	@Override
	public List<NoticeVO> selectNotice(NoticePageVO vo) {
		logger.info("공지사항 selectNotice {}");
		return sqlSession.selectList(NS+"selectNotice",vo);
	}

	

	
	
	

}
