package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.reser.vo.CoVO;

/**
 * Servlet implementation class MemeberInsert
 */
@WebServlet("/GuestInsert.do")
public class GuestInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuestInsert() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		MemberVO vo = new MemberVO();
		
		vo.setMem_add1(request.getParameter("mem_add1"));
		vo.setMem_add2(request.getParameter("mem_add2"));
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IMemberService service = MemberServiceImpl.getService();
		
		String id = service.guestInsert(vo);
		//석기현
		String insert = service.insertCart(vo.getMem_id());
				
		request.setAttribute("id", id);
		
		request.getRequestDispatcher("/memberJoin/memberInsert.jsp").forward(request, response);
		
		
		
	
	}

}
