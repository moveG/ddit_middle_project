package kr.or.ddit.mytrip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.mytrip.service.IMyTripService;
import kr.or.ddit.mytrip.service.MyTripServiceImpl;

/**
 * Servlet implementation class MyTripDelet
 */
@WebServlet("/MyTripDelet.do")
public class MyTripDelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTripDelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int mytrip_no = Integer.parseInt(request.getParameter("mytrip_no"));

		IMyTripService service = MyTripServiceImpl.getService();

		int cnt = service.myTripDelete(mytrip_no);

		request.setAttribute("cnt", cnt);

		request.getRequestDispatcher("/mytrip/deleteCheck.jsp").forward(request, response);
	}

}
