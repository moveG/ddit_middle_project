package kr.or.ddit.titem.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;


import kr.or.ddit.titem.vo.TitemVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class TitemDaoImpl implements ITitemDao{
	private static ITitemDao dao;
	
	private SqlMapClient smc;
	
	private TitemDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static ITitemDao getInstance() {
		if(dao == null) {
			dao = new TitemDaoImpl();
		}
		return dao;
	}

	@Override
	public int insertTitem(TitemVO vo) throws SQLException {
		return (Integer)smc.update("titem.insertTitme", vo);
	}
	

}
