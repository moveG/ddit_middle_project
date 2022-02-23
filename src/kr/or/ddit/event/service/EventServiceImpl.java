package kr.or.ddit.event.service;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapException;

import kr.or.ddit.event.dao.EventDaoImpl;
import kr.or.ddit.event.dao.IEventDao;
import kr.or.ddit.event.vo.EventVO;
import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.notice.dao.NoticeDaoImpl;
import kr.or.ddit.notice.vo.NoticeVO;

public class EventServiceImpl implements IEventService{
	
	private static IEventService service;
	
	public static IEventService getInstance() {
		
		if(service == null) {
			service = new EventServiceImpl();
		}
		return service;
		
	}
	
	private IEventDao dao;
	
	private EventServiceImpl() {
		dao = EventDaoImpl.getInstance();
	}

	@Override
	public List<EventVO> selectAllEventBoard() {
		// TODO Auto-generated method stub
		return dao.selectAllEventBoard();
	}

	@Override
	public String insertEventBoard(EventVO vo) {
		// TODO Auto-generated method stub
		return dao.insertEventBoard(vo);
	}

	@Override
	public EventVO selectEventBoard(int EventBoardNum) {
		// TODO Auto-generated method stub
		return dao.selectEventBoard(EventBoardNum);
	}

	
	
	

	
	
}
