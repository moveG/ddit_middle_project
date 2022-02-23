package kr.or.ddit.gurlist.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.gurlist.vo.ReservationVO;

public interface IGurListDao {
	//예약 리스트 출력
	public List<ReservationVO> gurList(String mem_id) throws SQLException;
}
