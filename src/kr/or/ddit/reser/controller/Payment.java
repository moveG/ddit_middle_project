package kr.or.ddit.reser.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cmm.service.AtchFileServiceImpl;
import kr.or.ddit.cmm.service.IAtchFileService;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.reser.service.IStayService;
import kr.or.ddit.reser.service.StayServiceImpl;
import kr.or.ddit.reser.vo.ReservationVO;
import kr.or.ddit.reser.vo.StayVO;
import kr.or.ddit.stay.vo.MemberVO1;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment.do")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reser_no = request.getParameter("rnum");
		
		//String reser_no = "212";
		
		IStayService service = StayServiceImpl.getInstance();
		
		StayVO vo = new StayVO();
		ReservationVO revo = new ReservationVO();
		MemberVO1 mevo = new MemberVO1();
		int people = 0;
		
		vo = service.stayselectReStayDetail(reser_no);
		revo = service.selectReDetail(reser_no);
		people = service.RePeople(reser_no);
		mevo = service.MemInfo(reser_no);
		
		
		System.out.println("void는?>"+vo.getStay_id());
		System.out.println("파일아이디는>"+vo.getAtch_file_id());
		
			if(vo.getAtch_file_id() > 0) {
			
			AtchFileVO fileVO = new AtchFileVO();
			
			fileVO.setAtchFileId(vo.getAtch_file_id());
			
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			
			List<AtchFileVO> atchFileList = fileService.getAtchFileList(fileVO);
			
				request.setAttribute("atchFileList", atchFileList);
			
		}
		
			
		request.setAttribute("mevo", mevo);	
		request.setAttribute("stayVO", vo);
		request.setAttribute("reserVO", revo);
		request.setAttribute("people", people);
		
		System.out.println("mevo확인 : "+mevo.getMem_name());
		
		request.getRequestDispatcher("pay/paymain.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
