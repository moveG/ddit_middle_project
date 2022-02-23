package kr.or.ddit.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;

/**
 * Servlet implementation class ReviewReplyDelete
 */
@WebServlet("/DeleteReply.do")
public class DeleteReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReply() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		
		IReviewService service = ReviewServiceImpl.getInstance();
		
		int num = service.deleteReply(review_no);
		
		request.setAttribute("num", num);
		request.setAttribute("review_no", review_no);
		
		request.getRequestDispatcher("/review/deleteReply.jsp").forward(request, response);
	}

}
