package kr.or.ddit.reser.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reser.service.IStayService;
import kr.or.ddit.reser.service.StayServiceImpl;
import kr.or.ddit.reser.vo.ReservationVO;

/**
 * Servlet implementation class ReserList
 */
@WebServlet("/reservation/ReserList.do")
public class ReserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String stay_id = request.getParameter("stay_id");
		
		IStayService service = StayServiceImpl.getInstance();
		
		List<ReservationVO> list = service.reserList(stay_id);
		
		for(int i = 0; i < list.size(); i++) {
			String end = (String) list.get(i).getReser_ckout();
			String end2 = end.substring(0, 10);
			end2 += " 24:00:00";
			
			list.get(i).setReser_ckout(end2);
		}
	
		request.setAttribute("rList", list);
		request.getRequestDispatcher("/reservation/reserList.jsp").forward(request, response);
	}

}
