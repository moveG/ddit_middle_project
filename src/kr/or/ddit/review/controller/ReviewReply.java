package kr.or.ddit.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.review.vo.ReviewAVO;

/**
 * Servlet implementation class ReviewReply
 */
@WebServlet("/ReviewReply.do")
public class ReviewReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewReply() {
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		
		IReviewService service = ReviewServiceImpl.getInstance();
		
		ReviewAVO vo = service.replyList(review_no);
		
		request.setAttribute("ravo", vo);
		
		request.getRequestDispatcher("/review/reviewReply.jsp").forward(request, response);
	}
}
