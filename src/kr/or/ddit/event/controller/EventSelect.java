package kr.or.ddit.event.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.event.service.EventServiceImpl;
import kr.or.ddit.event.service.IEventService;
import kr.or.ddit.event.vo.EventVO;

/**
 * Servlet implementation class EventSelect
 */
@WebServlet("/EventSelect.do")
public class EventSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		IEventService service = EventServiceImpl.getInstance();
		
		List<EventVO> list = service.selectAllEventBoard();
		
		request.setAttribute("eventList", list);
		
		request.getRequestDispatcher("event/event.jsp").forward(request, response);
		
		
		
		
	}

}
