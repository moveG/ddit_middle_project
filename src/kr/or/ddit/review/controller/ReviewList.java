package kr.or.ddit.review.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.review.vo.ReviewVO;

/**
 * Servlet implementation class Review
 */
@WebServlet("/ReviewList.do")
public class ReviewList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//페이지별 리스트 가져오기
		//0. 클라이언트 요청시 전송되는 데이터 가져오기(현재 page)
		String stay_id = request.getParameter("stay_id");
		IReviewService service = ReviewServiceImpl.getInstance();
		
		List<ReviewVO> list = service.reviewList(stay_id);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/review/reviewList.jsp").forward(request, response);
	}
}
