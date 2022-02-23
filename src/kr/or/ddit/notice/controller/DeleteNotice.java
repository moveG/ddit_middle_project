package kr.or.ddit.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;

/**
 * Servlet implementation class DeleteNotice
 */
@WebServlet("/DeleteNotice.do")
public class DeleteNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNotice() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doGet(req, resp);
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int cnt = service.deleteNotice(notice_no);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("notice/result.jsp").forward(request, response);
	}


}
