package kr.or.ddit.mytrip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.or.ddit.mytrip.service.IMyTripService;
import kr.or.ddit.mytrip.service.MyTripServiceImpl;

/**
 * Servlet implementation class MyTripSuggestion
 */
@WebServlet("/MyTripSuggestion.do")
public class MyTripSuggestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTripSuggestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int mytrip_no = Integer.parseInt(request.getParameter("no"));
		
		IMyTripService service = MyTripServiceImpl.getService();
		
		int cnt = service.myTripSuggestion(mytrip_no);
		
		int reno = service.suggestionSelect(mytrip_no);
		
		request.setAttribute("reno", reno);
		request.setAttribute("result", cnt);
		
		System.out.println(cnt);
		
		request.getRequestDispatcher("/mytrip/suggestionCheck.jsp").forward(request, response);
		
	/*	JsonObject json = new JsonObject();
		json.addProperty("result", cnt);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(json);*/
		
	
	}

}
