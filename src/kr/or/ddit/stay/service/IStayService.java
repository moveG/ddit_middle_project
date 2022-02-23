package kr.or.ddit.stay.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.stay.vo.CoDetailVO;
import kr.or.ddit.stay.vo.CoVO;
import kr.or.ddit.stay.vo.StayCalVO;
import kr.or.ddit.stay.vo.StayVO;

public interface IStayService {

	
	public String insertStay(StayVO vo);
	

	public String insertCoDetail(CoDetailVO vo);
	
	
	public String insertCo(CoVO vo);
	
	
	//숙소 아이디를 받아 그 아이디에 맞는 숙소 정보를 출력
	public StayVO selectStay(String stay_id);
	
	
	public List<StayVO> selectAllStay(int host_no);
	
	
	public int updateStay(StayVO vo);
	
	
	public int updateCoDetail(CoDetailVO vo);
	
	
	public CoDetailVO selectCoDetail(String stay_id);
	
	
	public int deleteCodetail(String co_id);
	public int deleteStay(String stay_id);
	public int deleteCo(String stay_id);
	public int deleteRe(String stay_id);
	
	public String selectRE(String stay_id);
	
	public int deleteStayCart(String stay_id);
	
	//호스트 회원이 등록한 stay_id 출력
	public List<String> selectHostStayId(int host_no);
		
	//호스트의 stay_id를 이용해 달력에 맞는 이름, 체크인, 체크아웃 정보를 뺸다.
	public List<StayCalVO> selectStayName(int host_no);
	
	
	
}
