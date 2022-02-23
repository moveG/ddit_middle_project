package kr.or.ddit.reser.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.reser.service.IStayService;
import kr.or.ddit.reser.service.StayServiceImpl;
import kr.or.ddit.reser.vo.ReservationVO;

/**
 * Servlet implementation class reserStay
 */
@WebServlet("/reservation/ReserStay.do")
public class ReserStay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserStay() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		ReservationVO vo = new ReservationVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IStayService service = StayServiceImpl.getInstance();
		
		String num = service.reservation(vo);

		request.setAttribute("num", num);
		request.getRequestDispatcher("/reservation/stayInsert.jsp").forward(request, response);
	}
}
