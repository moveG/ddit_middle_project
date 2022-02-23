package kr.or.ddit.search.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.reser.vo.StayVO;



public interface ISearchDao {
	
	//검색된 숙소 리스트 조회
	public List<StayVO> selectSearchStay(String stay_add);
	
}
