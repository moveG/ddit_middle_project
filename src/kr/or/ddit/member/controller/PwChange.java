package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class PwChange
 */
@WebServlet("/PwChange.do")
public class PwChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwChange() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO vo = new MemberVO();
		
		vo.setMem_id((String)request.getParameter("mem_id"));
		vo.setMem_tel((String)request.getParameter("mem_tel"));
		vo.setMem_pass((String)request.getParameter("mem_pass"));
		
		IMemberService service = MemberServiceImpl.getService();
		
		int cnt = service.tampPassword(vo);
		
		System.out.println(cnt);
		System.out.println(vo.getMem_pass());
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("memberJoin/pwChange.jsp").forward(request, response);
	
	}

}
