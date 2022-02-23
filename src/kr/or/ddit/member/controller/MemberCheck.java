package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

/**
 * Servlet implementation class MemberCheck
 */
@WebServlet("/MemberCheck.do")
public class MemberCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// id값 가져오기
		String member_id = request.getParameter("id");
		// 서비스 객체 선언
		IMemberService service = MemberServiceImpl.getService();
		// 결과값 받아오기
		String selectId = service.memberCheck(member_id);
		// 결과값을 request에 저장
		request.setAttribute("id", selectId);
		
		// jsp로 forward
		request.getRequestDispatcher("memberJoin/memberCheck.jsp").forward(request, response);
		
	}

}
