package kr.or.ddit.cart.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.cart.vo.StayCartVO;
import kr.or.ddit.stay.vo.StayVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class CartDaoImpl implements ICartDao{

	
	private static ICartDao cartDao;
	
	private SqlMapClient smc =SqlMapClientFactory.getInstance();
	
	private CartDaoImpl() {
		
	}
	
	public static ICartDao getInstance() {
		if(cartDao==null) {
			cartDao = new CartDaoImpl();
		}
		
		return cartDao;
	}

	@Override
	public List<String> selectAllCartStay_Id(int cart_no) {
		
		
		List<String> list = null;
		
		try {
			list = (List<String>)smc.queryForList("cart.selectAllCartStay_Id",cart_no);
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public StayVO selectStay(String stay_id) {
	
		
		StayVO vo = new StayVO();
		
		
		try {
			vo = (StayVO)smc.queryForObject("cart.selectStay",stay_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return vo;
	}

	@Override
	public String insertStayCart(StayCartVO vo) {
		
		
		String insert = "";
		
		try {
			insert = (String)smc.insert("cart.insertStayCart",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return insert;
	}

	@Override
	public int selectCartNo(String mem_id) {
	
		
		int cart_no = 0;
		
		try {
			cart_no = (Integer)smc.queryForObject("cart.selectCartNo", mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return cart_no;
	}

	@Override
	public int checkCart(String mem_id) {
		
		int cnt = 0;
		
		
		try {
			cnt = (Integer)smc.queryForObject("cart.checkCart",mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return cnt;
	}

	@Override
	public String insertCart(String mem_id) {
		
		
		String insert = "";
		
		try {
			insert = (String)smc.insert("cart.insertCart",mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return insert;
	}

	@Override
	public int deleteStayCart(StayCartVO vo) {
		
		int cnt = 0;
		
		try {
			cnt = smc.delete("cart.deleteStayCart",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int stayIdCheck(StayCartVO vo) {
	
		int cnt = 0;
		
		try {
			cnt = (Integer)smc.queryForObject("cart.stayIdCheck",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}
	
	
	
	
	

}
