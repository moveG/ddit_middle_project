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
import kr.or.ddit.mytrip.vo.MyTripCommentVO;

/**
 * Servlet implementation class CommentInsert
 */
@WebServlet("/CommentInsert.do")
public class CommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		MyTripCommentVO vo = new MyTripCommentVO();
		
		vo.setMem_id((String)session.getAttribute("mem_id"));
		vo.setMytrip_no(Integer.parseInt(request.getParameter("no")));
		vo.setMytripc_content((String)request.getParameter("cont"));
		
		IMyTripService service = MyTripServiceImpl.getService();
		
		int cnt = service.insertComment(vo);
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/mytrip/commentCheck.jsp").forward(request, response);
	
	
	}

}
