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
 * Servlet implementation class UpdateMember
 */
@WebServlet("/UpdateMember.do")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int host_no = 0;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("host_no") != null) {
		 host_no = (Integer)session.getAttribute("host_no");
		}
		
		String mem_id = request.getParameter("mem_id");
		
		IMemberService service = MemberServiceImpl.getService();
		
		MemberVO vo = null;
		
		
		vo = service.selectMemberList(mem_id);
		
		
		request.setAttribute("memberVO", vo);
		
		if(host_no != 0) {
		request.getRequestDispatcher("host/updateMember.jsp").forward(request, response);
		}else {
		request.getRequestDispatcher("guestReserList/updateMember.jsp").forward(request, response);
		}
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int host_no =0;
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("host_no") != null) {
			host_no = (Integer)session.getAttribute("host_no");
		}
		
		String mem_add = request.getParameter("MEM_ADD");
		
		String mem_name = request.getParameter("MEM_NAME");
		System.out.println("이름"+mem_name);
		String mem_email = request.getParameter("MEM_EMAIL");
		System.out.println("이름"+mem_email);
		String mem_add1 = request.getParameter("MEM_ADD1");
		System.out.println("이름"+mem_add1);
		String mem_add2 = request.getParameter("MEM_ADD2");
		System.out.println("이름"+mem_add2);
		String mem_tel = request.getParameter("MEM_TEL");
		System.out.println("이름"+mem_tel);
		String mem_id = request.getParameter("mem_id");
		System.out.println("이름"+mem_id);
		
	
		
		
		System.out.println("이름"+mem_add);
		
		MemberVO vo = new MemberVO();
		
		vo.setMem_id(mem_id);
		vo.setMem_name(mem_name);
		vo.setMem_add1(request.getParameter("MEM_ADD1"));
		vo.setMem_add2(request.getParameter("MEM_ADD2"));
		vo.setMem_email(mem_email);
		vo.setMem_add(mem_add);
		vo.setMem_tel(mem_tel);
		
		
		/*vo.setMem_add1(mem_add1);
		vo.setMem_add2(mem_add2);*/
		
		IMemberService service = MemberServiceImpl.getService();
		
		int cnt = service.updateMember(vo);
		
		request.setAttribute("updateMember",cnt);
		
		request.getRequestDispatcher("/MemberList.do").forward(request, response);
	
	}

}
