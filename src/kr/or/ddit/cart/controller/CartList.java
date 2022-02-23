package kr.or.ddit.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.cart.vo.StayCartVO;
import kr.or.ddit.cmm.service.AtchFileServiceImpl;
import kr.or.ddit.cmm.service.IAtchFileService;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.stay.vo.StayVO;

/**
 * Servlet implementation class CartList
 */
@WebServlet("/CartList.do")
public class CartList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//String mem_id = request.getParameter("mem_id");
		HttpSession session = request.getSession();
		
		String mem_id = (String)session.getAttribute("mem_id");
		System.out.println("멤버 아이디떠라"+mem_id);
		
		//멤버 아이디를 이용해 cart_id를 추출
		//그리고 stayid 추출
		
		
		
		ICartService cartService = CartServiceImpl.getInstance();
		
		List<String> stay_id_list = new ArrayList<String>();
		List<StayVO> stayvo = new ArrayList<StayVO>();
		
		
		int cart_id = cartService.selectCartNo(mem_id);
		System.out.println("카트 no"+cart_id);
		List<AtchFileVO> atchList = new ArrayList<>();
		stay_id_list = cartService.selectAllCartStay_Id(cart_id);
		
		
		for(int i=0; i<stay_id_list.size(); i++) {
			System.out.println("횟수"+i);
			stayvo.add(cartService.selectStay(stay_id_list.get(i)));
		
		}
		
		
		for(int i = 0; i < stayvo.size(); i++) {
			if(stayvo.get(i).getAtch_file_id() > 0) {
				
				AtchFileVO fileVO = new AtchFileVO();
				System.out.println(stayvo.get(i).getAtch_file_id());
				fileVO.setAtchFileId(stayvo.get(i).getAtch_file_id());
				
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				atchList.add(fileService.getAtchList(fileVO));
				
			}
		}

		request.setAttribute("atchList", atchList);
		
		request.setAttribute("staylist", stayvo);
		
		request.getRequestDispatcher("cart/mycart.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
