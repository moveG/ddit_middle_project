package kr.or.ddit.search.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.reser.vo.StayVO;
import kr.or.ddit.search.vo.SearchVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class SearchDaoImpl implements ISearchDao{

	private static ISearchDao dao;
	
	private SqlMapClient smc;
	
	private SearchDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static ISearchDao getInstance() {
		if(dao == null) {
			dao = new SearchDaoImpl();
		}
		return dao;
	}

	@Override
	public List<StayVO> selectSearchStay(String stay_add)  {
		
		List<StayVO> vo = null;
		
		try {
			vo = smc.queryForList("search.selectSearchStay", stay_add);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
		
		
		
	}
	
	
}
