package kr.or.ddit.faq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.faq.service.FaqServiceImpl;
import kr.or.ddit.faq.service.IFaqService;
import kr.or.ddit.faq.vo.FaqVO;

/**
 * Servlet implementation class SelectFaq
 */
@WebServlet("/SelectFaq.do")
public class SelectFaq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFaq() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int faq_no = Integer.parseInt(request.getParameter("faq_no"));
		
		IFaqService service = FaqServiceImpl.getInstance();
		
		FaqVO vo = service.selectFaq(faq_no);
		
		request.setAttribute("faq_no", faq_no);
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("faq/selectFaq.jsp").forward(request, response);
		
	}

}
