package kr.or.ddit.stay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.ddit.stay.service.IStayService;
import kr.or.ddit.stay.service.StayServiceImpl;
import kr.or.ddit.stay.vo.StayVO;

/**
 * Servlet implementation class deleteStay
 */
@WebServlet("/deleteStay.do")
public class deleteStay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteStay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String stay_id = request.getParameter("stay_id");
		
		IStayService service = StayServiceImpl.getInstance();
		
		service.deleteStayCart(stay_id);
		StayVO vo = service.selectStay(stay_id);
		
		String stay_name = vo.getStay_name();

		
		
		

		int check = service.deleteStay(stay_id);
		
		
		
		
		
		
		request.setAttribute("check", check);
		request.setAttribute("stay_name", stay_name);
		
		request.getRequestDispatcher("stay/resultDelete.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
