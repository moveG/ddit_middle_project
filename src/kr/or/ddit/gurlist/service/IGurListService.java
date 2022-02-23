package kr.or.ddit.gurlist.service;

import java.util.List;

import kr.or.ddit.gurlist.vo.ReservationVO;

public interface IGurListService {
	//예약 리스트 출력
	public List<ReservationVO> gurList(String mem_id);
}
