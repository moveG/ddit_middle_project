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
import kr.or.ddit.reser.vo.ReservationVO;

/**
 * Servlet implementation class ReserCheck2
 */
@WebServlet("/reservation/ReserCheck2.do")
public class ReserCheck2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserCheck2() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");

		IStayService service = StayServiceImpl.getInstance();
		
		String stay_id = (String) request.getParameter("stay_id"); 
		
		ReservationVO rvo = new ReservationVO();
		rvo.setStay_id(stay_id);
		rvo.setMem_id(mem_id);
		int num = service.reserbutton(rvo);
		ReservationVO rvo2 = service.reserbutton2(rvo);
		/*
		request.setAttribute("rbutton", num);
		System.out.println("ㅋㅋㅋㅋㅋㅋ" + num);*/
		request.setAttribute("rvo3", rvo2);
		request.getRequestDispatcher("/reservation/stayDetail.jsp").forward(request, response);
	}

}
