package kr.or.ddit.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.cart.vo.StayCartVO;

/**
 * Servlet implementation class deleteCart
 */
@WebServlet("/deleteCart.do")
public class deleteCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//세션이나 request든 mem_id를 구해온다.
		
		HttpSession session = request.getSession();
		
		String mem_id = (String)session.getAttribute("mem_id");
		System.out.println("멤버 아이디떠라"+mem_id);
		
		
		
		String[] StayId = request.getParameterValues("stay_id");
		
		ICartService service = CartServiceImpl.getInstance();
		
		int cart_no = service.selectCartNo(mem_id);
		
		
		for(int i=0; i<StayId.length;i++) {
				StayCartVO vo = new StayCartVO();
			
				vo.setCart_no(cart_no);
				vo.setStay_id(StayId[i]);
				service.deleteStayCart(vo);
		}
		
		
		
		response.sendRedirect("/FireMoth/CartList.do");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
