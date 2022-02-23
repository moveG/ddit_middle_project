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
 * Servlet implementation class MyTripFollow
 */
@WebServlet("/MyTripFollow.do")
public class MyTripFollow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTripFollow() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String stay_id = (String)request.getParameter("stay_id");
		
		
		IMyTripService service = MyTripServiceImpl.getService();
		
		long atch_file_id = service.myTripFollow(stay_id);
		request.setAttribute("stay_id", stay_id);
		request.setAttribute("atch_file_id", atch_file_id);
		
		
		System.out.println(stay_id);
		System.out.println(atch_file_id);
		request.getRequestDispatcher("/mytrip/Follow.jsp").forward(request, response);
		
	
	}

}
