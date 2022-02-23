package kr.or.ddit.notice.service;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapException;

import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.notice.dao.NoticeDaoImpl;
import kr.or.ddit.notice.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService{
	
	private static INoticeService service;
	
	public static INoticeService getInstance() {
		
		if(service == null) {
			service = new NoticeServiceImpl();
		}
		return service;
		
	}
	
	private INoticeDao dao;
	
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getInstance();
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		int num = 0;
		
		try {
			num = dao.insertNotice(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return num;
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		int num = 0;
		
		try {
			num = dao.updateNotice(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return num;
	}

	@Override
	public NoticeVO selectNotice(int notice_no) {
		NoticeVO vo = new NoticeVO();
		
		try {
			vo = dao.selectNotice(notice_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public int deleteNotice(int notice_no) {
		int num = 0;
		
		try {
			num = dao.deleteNotice(notice_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return num;
	}

	@Override
	public List<NoticeVO> selectAllNotice() {
		List<NoticeVO> vo = null;
		
		try {
			vo = dao.selectAllNotice();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
		
	}

	
	

	
	
}
