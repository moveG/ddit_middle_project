package kr.or.ddit.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;

/**
 * Servlet implementation class SelectNotice
 */
@WebServlet("/SelectNotice.do")
public class SelectNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   int notice_no = Integer.parseInt(req.getParameter("nonono"));
		
		System.out.println("여기는 서블릿 " + notice_no);
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		NoticeVO vo = service.selectNotice(notice_no);
		
		
		req.setAttribute("notice_no", notice_no);
		req.setAttribute("vo", vo);
		
		req.getRequestDispatcher("notice/selectNotice.jsp").forward(req, resp);
   }
   
    

}
