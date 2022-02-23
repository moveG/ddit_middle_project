package kr.or.ddit.search.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.reser.vo.StayVO;
import kr.or.ddit.search.vo.SearchVO;

public interface ISearchService {
	
	//검색된 숙소 리스트 조회
	public List<StayVO> selectSearchStay(String stay_add);
	
}
