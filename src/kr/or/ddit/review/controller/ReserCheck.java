package kr.or.ddit.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.reser.vo.ReservationVO;
import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;

/**
 * Servlet implementation class HostCheck
 */
@WebServlet("/ReserCheck.do")
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
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		String stay_id = request.getParameter("stay_id");
		
		IReviewService service = ReviewServiceImpl.getInstance();
		
		ReservationVO vo = new ReservationVO();
		vo.setMem_id(mem_id);
		vo.setStay_id(stay_id);
		
		int num = service.reserCheck(vo);
		
		request.setAttribute("num", num);
		
		request.getRequestDispatcher("/review/reserCheck.jsp").forward(request, response);
	}

}
