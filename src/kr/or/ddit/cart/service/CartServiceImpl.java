package kr.or.ddit.cart.service;

import java.util.List;

import kr.or.ddit.cart.dao.CartDaoImpl;
import kr.or.ddit.cart.dao.ICartDao;
import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.cart.vo.StayCartVO;
import kr.or.ddit.stay.vo.StayVO;

public class CartServiceImpl implements ICartService{

	
	private static ICartService cartService;
	
	
	public static ICartService getInstance() {
		if(cartService==null) {
			cartService = new CartServiceImpl();
	    }
		
		return cartService;
	 }
	
	private ICartDao cartDao;
	private CartServiceImpl() {
		cartDao = CartDaoImpl.getInstance();
	}
	

	@Override
	public List<String> selectAllCartStay_Id(int cart_no) {
		
		return cartDao.selectAllCartStay_Id(cart_no);
	}

	@Override
	public StayVO selectStay(String stay_id) {
		
		return cartDao.selectStay(stay_id);
	}


	@Override
	public String insertStayCart(StayCartVO vo) {
		
		
		return cartDao.insertStayCart(vo);
	}


	@Override
	public int selectCartNo(String mem_id) {
		
		return cartDao.selectCartNo(mem_id);
	}


	@Override
	public int checkCart(String mem_id) {
		
		
		return cartDao.checkCart(mem_id);
	}


	@Override
	public String insertCart(String mem_id) {
		
		return cartDao.insertCart(mem_id);
	}


	@Override
	public int deleteStayCart(StayCartVO vo) {
		
		return cartDao.deleteStayCart(vo);
	}


	@Override
	public int stayIdCheck(StayCartVO vo) {
		
		return cartDao.stayIdCheck(vo);
	}
	
	
	
	
	
	
}
