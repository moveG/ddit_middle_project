package kr.or.ddit.reser.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reser.service.IStayService;
import kr.or.ddit.reser.service.StayServiceImpl;
import kr.or.ddit.reser.vo.ReservationVO;

/**
 * Servlet implementation class ReserCheck
 */
@WebServlet("/reservation/ReserCheck.do")
public class ReserCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserCheck() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String reser_ckin = request.getParameter("reser_ckin");
		String reser_ckout = request.getParameter("reser_ckout");
		String stay_id = request.getParameter("stay_id");
		
		IStayService service = StayServiceImpl.getInstance();
		
		ReservationVO vo = new ReservationVO();
		vo.setReser_ckin(reser_ckin);
		vo.setReser_ckout(reser_ckout);
		vo.setStay_id(stay_id);
		
		int reserCheck = service.reserCheck(vo);
		
		request.setAttribute("reserCheck", reserCheck);
		request.getRequestDispatcher("/reservation/reserCheck.jsp").forward(request, response);
	}

}
