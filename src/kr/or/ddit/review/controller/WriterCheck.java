package kr.or.ddit.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.review.vo.ReviewVO;

/**
 * Servlet implementation class WriterCheck
 */
@WebServlet("/WriterCheck.do")
public class WriterCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriterCheck() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		String stay_id = request.getParameter("stay_id");
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		
		IReviewService service = ReviewServiceImpl.getInstance();
		
		ReviewVO vo = new ReviewVO();
		vo.setMem_id(mem_id);
		vo.setStay_id(stay_id);
		vo.setReview_no(review_no);
		
		int num = service.writerCheck(vo);
		
		request.setAttribute("num", num);
		request.setAttribute("review_no", review_no);
		request.getRequestDispatcher("/review/writerCheck.jsp").forward(request, response);
	}

}
