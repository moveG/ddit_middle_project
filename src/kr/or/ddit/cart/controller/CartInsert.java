package kr.or.ddit.cart.controller;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.cart.vo.StayCartVO;
import kr.or.ddit.stay.service.IStayService;
import kr.or.ddit.stay.service.StayServiceImpl;
import kr.or.ddit.stay.vo.StayVO;

/**
 * Servlet implementation class CartInsert
 */
@WebServlet("/CartInsert.do")
public class CartInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//세션에서 게스트인 mem_id를 가지고 온다.
		//request로 stay_id를 가지고 온다.
		
		HttpSession session = request.getSession();
		
		String mem_id = (String)session.getAttribute("mem_id");
		System.out.println("멤버 아이디떠라"+mem_id);
		
		
		
		
		
		String stay_id = request.getParameter("stay_id");
		
		
		
		ICartService service = CartServiceImpl.getInstance();
		
		/*//장바구니 숫자 체크
		int cartCnt = service.checkCart(mem_id);
		
		//없다면 새로 만들어 주고 있다면 그냥 감
		if(cartCnt==0) {
			
			
			//cart테이블에 새로 만들어야함
			service.insertCart(mem_id);
			
			
		}else {
			System.out.println(cartCnt+"개 존재");
		}*/
		
		//cart_no를 알아내기 위한 
		int cart_no = service.selectCartNo(mem_id);
		
		StayCartVO vo = new StayCartVO();
		
		vo.setCart_no(cart_no);
		vo.setStay_id(stay_id);
		String msg = stay_id;
		
		
		IStayService service1 = StayServiceImpl.getInstance();
		
		StayVO vo1 = new StayVO();
		
		vo1 = service1.selectStay(stay_id);
		String stay_name = vo1.getStay_name();
		System.out.println("떠라떠라"+stay_name);
		
		//stay_id가 중복되지 않게 유무 체크 vo
		int cnt = service.stayIdCheck(vo);
		
		System.out.print("숫자"+cnt);
		if(cnt>0) {
			
			
			msg = stay_name+"는 장바구니에 이미 존재하는 숙소 입니다.";
			
			request.setAttribute("msg", msg);
			request.setAttribute("cnt", cnt);
			request.getRequestDispatcher("cart/cartCheck.jsp").forward(request, response);
			
		
		}else {
		
		msg = stay_name;
		//장바구니 담기 디테일 테이블 인서트
		service.insertStayCart(vo);
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("msg", msg);
		
		request.getRequestDispatcher("cart/cartCheck.jsp").forward(request, response);
		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
