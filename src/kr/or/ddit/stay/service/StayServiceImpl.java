package kr.or.ddit.stay.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.stay.dao.IStayDao;
import kr.or.ddit.stay.dao.StayDaoImpl;
import kr.or.ddit.stay.vo.CoDetailVO;
import kr.or.ddit.stay.vo.CoVO;
import kr.or.ddit.stay.vo.StayCalVO;
import kr.or.ddit.stay.vo.StayVO;

public class StayServiceImpl implements IStayService{

	
	private static IStayService stayService;
	
	
	public static IStayService getInstance() {
		
		if(stayService==null) {
			stayService = new StayServiceImpl();
		}
		
		return stayService;
	}
	
	
	private IStayDao stayDao;
	
	private StayServiceImpl() {

		stayDao = StayDaoImpl.getInstance();
	
	}
	
	
	
	@Override
	public String insertStay(StayVO vo) {
		String cnt = "";
		
		cnt = stayDao.insertStay(vo);
		
		
		return cnt;
	}



	@Override
	public String insertCoDetail(CoDetailVO vo) {
		
		String cnt = "";
		
		cnt = stayDao.insertCoDetail(vo);
		
		
		return cnt;
		
		
		
		
	}



	@Override
	public String insertCo(CoVO vo) {
		
		String cnt = "";
		
		cnt = stayDao.insertCo(vo);
		
		
		return cnt;
	}



	@Override
	public StayVO selectStay(String stay_id) {
		
		
		StayVO vo = new StayVO();
		
		
		vo = stayDao.selectStay(stay_id);
		
		
		return vo;
	}



	@Override
	public List<StayVO> selectAllStay(int host_no) {
		
		
		
		return stayDao.selectAllStay(host_no);
		
	}



	@Override
	public int updateStay(StayVO vo) {
		
		return stayDao.updateStay(vo);
	}



	@Override
	public int updateCoDetail(CoDetailVO vo) {
		
		return stayDao.updateCoDetail(vo);
	}



	@Override
	public CoDetailVO selectCoDetail(String stay_id) {
		
		return stayDao.selectCoDetail(stay_id);
	}



	@Override
	public int deleteCodetail(String co_id) {
		// TODO Auto-generated method stub
		return stayDao.deleteCodetail(co_id);
	}



	@Override
	public int deleteStay(String stay_id) {
		// TODO Auto-generated method stub
		return stayDao.deleteStay(stay_id);
	}



	@Override
	public int deleteCo(String stay_id) {
		// TODO Auto-generated method stub
		return stayDao.deleteCo(stay_id);
	}



	@Override
	public int deleteRe(String stay_id) {
		// TODO Auto-generated method stub
		return stayDao.deleteRe(stay_id);
	}



	@Override
	public String selectRE(String stay_id) {
		
		return stayDao.selectRE(stay_id);
	}



	@Override
	public int deleteStayCart(String stay_id) {
		
		
		return stayDao.deleteStayCart(stay_id);
	}



	@Override
	public List<String> selectHostStayId(int host_no) {

		return stayDao.selectHostStayId(host_no);
	}



	@Override
	public List<StayCalVO> selectStayName(int stay_id) {
		
		return stayDao.selectStayName(stay_id);
	}

	
	
	
}
