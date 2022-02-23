package kr.or.ddit.stay.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.stay.vo.CoDetailVO;
import kr.or.ddit.stay.vo.CoVO;
import kr.or.ddit.stay.vo.StayCalVO;
import kr.or.ddit.stay.vo.StayVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class StayDaoImpl implements IStayDao{

	
	private static SqlMapClient smc = SqlMapClientFactory.getInstance();
	
	private static IStayDao stayDao;
	
	private StayDaoImpl() {
	
	}
	
	public static IStayDao getInstance() {
		
		if(stayDao ==null) {
			stayDao = new StayDaoImpl();
		}
		
		return stayDao;
		
	}
	
	
	
	
	@Override
	public String insertStay(StayVO vo) {
		
		String cnt = "";
	    
	    
	    try {
			cnt =(String)smc.insert("stay.insertStay",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public String insertCoDetail(CoDetailVO vo) {

		String cnt = "";
	    
	    
	    try {
			cnt = (String)smc.insert("stay.insertCoDetail",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public String insertCo(CoVO vo) {
		
		String cnt ="";
		
		try {
			cnt = (String)smc.insert("stay.insertCo",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	

	@Override
	public StayVO selectStay(String stay_id){
	
	   
		StayVO vo = new StayVO();
		
		
		try {
				vo = (StayVO)smc.queryForObject("stay.selectStay", stay_id);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		
		return vo;
	}

	@Override
	public List<StayVO> selectAllStay(int host_no) {
	
		List<StayVO> list = new ArrayList<StayVO>();
		
		try {
			list = smc.queryForList("stay.selectAllStay",host_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

	@Override
	public int updateStay(StayVO vo) {
		
		int cnt = 0;
		
		
		try {
			cnt = smc.update("stay.updateStay",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
		
	}

	@Override
	public int updateCoDetail(CoDetailVO vo) {
	
		int cnt = 0;
		
		try {
			cnt = smc.update("stay.updateCoDetail",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
		
		
		
		
		
		
	}

	@Override
	public CoDetailVO selectCoDetail(String stay_id) {
		
		CoDetailVO vo = null;
		
		try {
			vo = (CoDetailVO)smc.queryForObject("stay.selectCoDetail",stay_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return vo;
	}

	@Override
	public int deleteCodetail(String co_id) {

		int cnt = 0;
		
		try {
			cnt = smc.delete("stay.deleteCodetail",co_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public int deleteStay(String stay_id) {
			int cnt = 0;
		
		try {
			cnt = smc.delete("stay.deleteStay",stay_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public int deleteCo(String stay_id) {
		int cnt = 0;
		
		try {
			cnt = smc.delete("stay.deleteCo",stay_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public int deleteRe(String stay_id) {
		
		int cnt = 0;
		
		try {
			cnt = smc.delete("stay.deleteRe",stay_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public String selectRE(String stay_id) {
		
		
		try {
			String a = (String)smc.queryForObject("stay.selectRE",stay_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	@Override
	public int deleteStayCart(String stay_id) {
		
		int cnt = 0;
		
		try {
			cnt = smc.delete("stay.deleteStayCart",stay_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public List<String> selectHostStayId(int host_no) {
		
		List<String> list = null;
		
		try {
			list = smc.queryForList("stay.selectHostStayId", host_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public  List<StayCalVO> selectStayName(int stay_id) {
		
		List<StayCalVO> list = null;
		
		
		
		try {
			list = (List<StayCalVO>)smc.queryForList("stay.selectStayName",stay_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	
	
	
	
	
	
}
