package kr.or.ddit.gurlist.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.gurlist.dao.GurListDaoImpl;
import kr.or.ddit.gurlist.dao.IGurListDao;
import kr.or.ddit.gurlist.vo.ReservationVO;

public class GurListServiceImpl implements IGurListService {
	private IGurListDao dao;
	
	//싱글톤 패턴 적용
	private static IGurListService service;
	private GurListServiceImpl() {
		dao = GurListDaoImpl.getInstance();
	}
	public static IGurListService getInstance() {
		if(service == null) {
			service = new GurListServiceImpl();
		}
		return service;
	}
	
	//예약 리스트 출력
	@Override
	public List<ReservationVO> gurList(String mem_id) {
		List<ReservationVO> list = null;
		
		try {
			list = dao.gurList(mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
