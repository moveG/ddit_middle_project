package kr.or.ddit.cart.service;

import java.util.List;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.cart.vo.StayCartVO;
import kr.or.ddit.stay.vo.StayVO;

public interface ICartService {

	//게스트 장바구니 안의 모든 숙소들 출력
	public List<String> selectAllCartStay_Id(int mem_id);
	
	//숙소 이름에 맞는 숙소에 대한 정보를 표출하기 위한 메서드
	public StayVO selectStay(String stay_id);

	//숙소카트 디테일에 정보를 입력
	public String insertStayCart(StayCartVO vo);
	
	//cartno를 찾기 위한 메서드
	public int selectCartNo(String mem_id);
	
	//회원의 장바구니의 유뮤(수)를 체크하기 위한 메서드
	public int checkCart(String mem_id);
	
	// 장바구니가 생성되지 않는 게스트 장바구니 생성
	public String insertCart(String mem_id);
	
	//장바구니 삭제하는 거
	public int deleteStayCart(StayCartVO vo);
	
	//숙소 아이디 체크하기 
	public int stayIdCheck(StayCartVO vo);
	
	
}
