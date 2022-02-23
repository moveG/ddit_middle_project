package kr.or.ddit.event.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapException;

import kr.or.ddit.event.vo.EventVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class EventDaoImpl implements IEventDao{

	private static IEventDao dao;
	
	private SqlMapClient smc;
	
	private EventDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IEventDao getInstance() {
		if(dao == null) {
			dao = new EventDaoImpl();
		}
		return dao;
	}

	@Override
	public List<EventVO> selectAllEventBoard() {
		
		List<EventVO> vo = null;
		
		try {
			vo = smc.queryForList("event.selectAllEventBoard");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return vo;
	}

	@Override
	public String insertEventBoard(EventVO vo) {
		
		
		String insert = "";
		
		try {
			insert = (String)smc.insert("event.insertEventBoard",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 
		return insert;
	}

	@Override
	public EventVO selectEventBoard(int EventBoardNum) {
		
		EventVO vo = null;
		
		try {
			vo = (EventVO)smc.queryForObject("event.selectEventBoard",EventBoardNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return vo;
	
	
	
	
	}


	

	
	
	
	
}
