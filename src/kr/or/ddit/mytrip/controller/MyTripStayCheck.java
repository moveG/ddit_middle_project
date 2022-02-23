package kr.or.ddit.mytrip.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.mytrip.service.IMyTripService;
import kr.or.ddit.mytrip.service.MyTripServiceImpl;
import kr.or.ddit.mytrip.vo.MyTripVO;

/**
 * Servlet implementation class MyTripStayCheck
 */
@WebServlet("/MyTripStayCheck.do")
public class MyTripStayCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTripStayCheck() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		String mem_id = (String)session.getAttribute("mem_id");
		
		System.out.println(" ==================================================="+mem_id);
		IMyTripService service = MyTripServiceImpl.getService();
		
		List<MyTripVO> list = service.myTripReservation(mem_id);
	
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/mytrip/myTripInsert.jsp").forward(request, response);
		
		
		
	}

}
