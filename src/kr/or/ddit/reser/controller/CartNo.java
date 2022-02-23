package kr.or.ddit.reser.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.reser.service.IStayService;
import kr.or.ddit.reser.service.StayServiceImpl;

/**
 * Servlet implementation class CartNo
 */
@WebServlet("/reservation/CartNo.do")
public class CartNo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartNo() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		IStayService service = StayServiceImpl.getInstance();
		
		
		int cart_no = service.cartNo(mem_id);
		
		request.setAttribute("cart_no", cart_no);
		request.getRequestDispatcher("/reservation/stayDetail.jsp").forward(request, response);
	}
}
