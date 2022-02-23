package kr.or.ddit.reser.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cmm.service.AtchFileServiceImpl;
import kr.or.ddit.cmm.service.IAtchFileService;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.reser.service.IStayService;
import kr.or.ddit.reser.service.StayServiceImpl;
import kr.or.ddit.reser.vo.CoVO;
import kr.or.ddit.reser.vo.ReservationVO;
import kr.or.ddit.reser.vo.StayVO;

/**
 * Servlet implementation class CoList
 */
@WebServlet("/reservation/StayDetail.do")
public class StayDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StayDetail() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		IStayService service = StayServiceImpl.getInstance();
		
		//숙소 아이디
		String stay_id = request.getParameter("stay_id");
		//숙소 사진
		long atch_file_id = Long.parseLong(request.getParameter("atch_file_id"));
		//편의시설
		CoVO vo = service.CoList(stay_id);
		//숙소
		StayVO svo = service.stayDetail(stay_id);
		//호스트 번호
		int host_no = svo.getHost_no();
		//호스트 아이디
		String host_id = service.host_id(host_no);
		//카트 번호
		int cartNo = service.cartNo(mem_id);
		
		ReservationVO rvo = new ReservationVO();
		rvo.setStay_id(stay_id);
		rvo.setMem_id(mem_id);
		int num = service.reserbutton(rvo);
		
		ReservationVO rvo2 = new ReservationVO();
		rvo2.setStay_id(stay_id);
		rvo2.setMem_id(mem_id);
		ReservationVO rvo3 = service.reserbutton2(rvo2);
		
		//이미지
		if(atch_file_id > 0) {
			AtchFileVO fileVO = new AtchFileVO();
			fileVO.setAtchFileId(atch_file_id);
			
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			List<AtchFileVO> atchList = fileService.getAtchFileList(fileVO);
			
			request.setAttribute("atchList", atchList);
		}
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("host_id", host_id);
		request.setAttribute("stay_id", stay_id);
		request.setAttribute("coList", vo);
		request.setAttribute("stayDetail", svo);
		request.setAttribute("rvo", svo);
		request.setAttribute("cartNo", cartNo);
		request.setAttribute("rvo3", rvo3);
		request.setAttribute("rbutton", num);
		
		request.getRequestDispatcher("/reservation/stayDetail.jsp").forward(request, response);
	}
}
