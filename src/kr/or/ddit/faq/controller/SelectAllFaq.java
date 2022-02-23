package kr.or.ddit.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.faq.service.FaqServiceImpl;
import kr.or.ddit.faq.service.IFaqService;
import kr.or.ddit.faq.vo.FaqVO;

/**
 * Servlet implementation class SelectAllFaq
 */
@WebServlet("/SelectAllFaq.do")
public class SelectAllFaq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllFaq() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IFaqService service = FaqServiceImpl.getInstance();
		
		List<FaqVO> list = service.selectAllFaq();
		
		request.setAttribute("FaqAll", list);
		
		request.getRequestDispatcher("faq/selectAllFaq.jsp").forward(request, response);
	}

}
