package kr.or.ddit.reser.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reser.service.IStayService;
import kr.or.ddit.reser.service.StayServiceImpl;

/**
 * Servlet implementation class ReserCancel
 */
@WebServlet("/reservation/ReserCancel.do")
public class ReserCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserCancel() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String reser_no = request.getParameter("reser_no");
		
		IStayService service = StayServiceImpl.getInstance();
		
		int num2 = service.reserCancelPeople(reser_no);
		int num = service.reserCancel(reser_no);
		
		request.setAttribute("num2", num2);
		request.setAttribute("num", num);
		
		request.getRequestDispatcher("/reservation/reserCancel.jsp").forward(request, response);
		
	}

}
