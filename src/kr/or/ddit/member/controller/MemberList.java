package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class MemberList
 */
@WebServlet("/MemberList.do")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String mem_id = (String)session.getAttribute("mem_id");

		IMemberService service = MemberServiceImpl.getService();

		
		MemberVO vo = null;
		
		vo = service.selectMemberList(mem_id);
		
		
		request.setAttribute("memberVO", vo);
		
		if((Integer)request.getAttribute("cnt")==null) {
			
		}else {
			int cnt = (Integer)request.getAttribute("cnt");
			request.setAttribute("cnt", cnt);
			System.out.println("cnt"+cnt);
		}
		
		
		
	
		
		
		System.out.println("호스트 판별"+session.getAttribute("host_no"));
		
		if(session.getAttribute("host_no")==null) {
			//게스트 회원 정보로 
			request.getRequestDispatcher("guestReserList/memberList.jsp").forward(request, response);
		}else {	
			//호스트 회원 정보로 
			request.getRequestDispatcher("host/memberList.jsp").forward(request, response);
		 }
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
