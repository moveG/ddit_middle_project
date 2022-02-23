package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.HostVO;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck.do")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheck() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		MemberVO vo = new MemberVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IMemberService service = MemberServiceImpl.getService();
		
		int cnt = service.loginCheck(vo);
		
		if (cnt > 0) {
			HostVO hvo = (HostVO)service.memberDivision(vo.getMem_id());
			session.setAttribute("mem_id", vo.getMem_id());
			if (hvo != null && hvo.getMem_id() != null) {
				session.setAttribute("division", "host");
				session.setAttribute("host_no", hvo.getHost_no());
			} else {
				session.setAttribute("division", "guest");
			}
		}
		
		System.out.println(session.getAttribute("mem_id"));
		System.out.println(session.getAttribute("division"));
		System.out.println(session.getAttribute("host_no"));
		
		
		request.setAttribute("division", session.getAttribute("division"));
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/memberJoin/loginCheck.jsp").forward(request, response);
	
	
	} 

}
