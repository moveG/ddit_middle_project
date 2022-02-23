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
import kr.or.ddit.mytrip.vo.MyTripCommentVO;

/**
 * Servlet implementation class MytripComment
 */
@WebServlet("/MytripComment.do")
public class MytripComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MytripComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		String memId = (String)session.getAttribute("mem_id");
		request.setAttribute("memId", memId);
		
		int mytrip_no = Integer.parseInt(request.getParameter("mytrip_no"));
		IMyTripService service = MyTripServiceImpl.getService();

		List<MyTripCommentVO> list = service.selectComment(mytrip_no);

		request.setAttribute("list", list);

		request.getRequestDispatcher("/mytrip/commentList.jsp").forward(request, response);


	}

}
