package kr.or.ddit.search.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.reser.vo.StayVO;
import kr.or.ddit.search.dao.ISearchDao;
import kr.or.ddit.search.dao.SearchDaoImpl;
import kr.or.ddit.search.vo.SearchVO;

public class SearchServiceImpl implements ISearchService{
	
	private static ISearchService service;
	
	public static ISearchService getInstance() {
		if(service == null) {
			service = new SearchServiceImpl();
		}
		return service;
	}
	
	private ISearchDao dao;
	
	private SearchServiceImpl() {
		dao = SearchDaoImpl.getInstance();
	}

	@Override
	public List<StayVO> selectSearchStay(String stay_add) {
		List<StayVO> vo = null;
		
		
			vo = dao.selectSearchStay(stay_add);
		
		
		return vo;
	}
	
	
	
}
