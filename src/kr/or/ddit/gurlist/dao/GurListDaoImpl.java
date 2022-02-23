package kr.or.ddit.gurlist.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.gurlist.vo.ReservationVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class GurListDaoImpl implements IGurListDao {
	private SqlMapClient smc;
	
	//싱글톤 패턴 적용
	private static IGurListDao dao;
	private GurListDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	public static IGurListDao getInstance() {
		if(dao == null) {
			dao = new GurListDaoImpl();
		}
		return dao;
	}
	
	//예약 리스트 출력
	@Override
	public List<ReservationVO> gurList(String mem_id) throws SQLException {
		return smc.queryForList("gurlist.gurList", mem_id);
	}

}
