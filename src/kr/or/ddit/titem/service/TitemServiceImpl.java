package kr.or.ddit.titem.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.titem.dao.ITitemDao;
import kr.or.ddit.titem.dao.TitemDaoImpl;
import kr.or.ddit.titem.vo.TitemVO;

public class TitemServiceImpl implements ITitemService{

	private static ITitemService service;
	private ITitemDao dao;
	
	private TitemServiceImpl() {
		dao = TitemDaoImpl.getInstance();
	}
	
	public static ITitemService getInstance() {
		if(service==null) {
			service = new TitemServiceImpl();
		}
		return service;
	}

	@Override
	public int insertTitem(TitemVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.insertTitem(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	
	
}
