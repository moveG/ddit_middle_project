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
 * Servlet implementation class DeleteReview
 */
@WebServlet("/DeleteReview.do")
public class DeleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReview() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		int review_no = Integer.parseInt(request.getParameter("review_no"));
	
		IReviewService service = ReviewServiceImpl.getInstance();
		
		int num1 = service.deleteReply(review_no);
		int num2 = service.deleteReview(review_no);
		
		request.setAttribute("num1", num1);
		request.setAttribute("num2", num2);
		request.setAttribute("review_no", review_no);
		
		request.getRequestDispatcher("/review/deleteReview.jsp").forward(request, response);
		
	}

}
