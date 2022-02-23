package kr.or.ddit.mytrip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.mytrip.service.IMyTripService;
import kr.or.ddit.mytrip.service.MyTripServiceImpl;
import kr.or.ddit.mytrip.vo.MyTripCommentVO;

/**
 * Servlet implementation class ReplayUpdate
 */
@WebServlet("/ReplyUpdate.do")
public class ReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MyTripCommentVO vo = new MyTripCommentVO();
		
		vo.setMytripc_content((String)request.getParameter("cont"));
		vo.setMytripc_no(Integer.parseInt(request.getParameter("mytripc_no")));
		
		IMyTripService service = MyTripServiceImpl.getService();
		int cnt = service.updateComment(vo);
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/mytrip/commentCheck.jsp").forward(request, response);
		
	
	}

}
