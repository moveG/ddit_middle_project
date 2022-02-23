package kr.or.ddit.mytrip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.mytrip.service.IMyTripService;
import kr.or.ddit.mytrip.service.MyTripServiceImpl;

/**
 * Servlet implementation class CommentDelete
 */
@WebServlet("/CommentDelete.do")
public class CommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();

		String mem_id = (String)request.getAttribute("mem_id");
		int mytripc_no = Integer.parseInt(request.getParameter("mytripc_no"));

		System.out.println(mytripc_no);
		IMyTripService service = MyTripServiceImpl.getService();

		int	cnt = service.commentDelete(mytripc_no);

		request.setAttribute("cnt", cnt);

		request.getRequestDispatcher("/mytrip/deleteCheck.jsp").forward(request, response);


	}

}
