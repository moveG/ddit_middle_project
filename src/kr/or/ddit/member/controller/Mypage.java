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

/**
 * Servlet implementation class Mypage
 */
@WebServlet("/Mypage.do")
public class Mypage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mypage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mem_id = (String)session.getAttribute("mem_id");
		
		IMemberService service = MemberServiceImpl.getService();
		
		int cnt = service.selectMember(mem_id);
		int memChk = 0;
		
		//멤버 체크
		if(cnt>0) {
			
			
	        //호스트인 경우 1을 반환 게스트인 경우 0을 반환
			memChk = service.checkHost(mem_id);
			request.setAttribute("memChk", memChk);

			
			request.getRequestDispatcher("/mypage/mypageCheck.jsp").forward(request, response);

		
		}else{
			
			//비회원인 경우 -1를 반환
			memChk=-1;
			request.setAttribute("memChk", memChk);

			request.getRequestDispatcher("/mypage/mypageCheck.jsp").forward(request, response);

		} 
		
		
		
	}

}
