package kr.or.ddit.stay.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cmm.service.AtchFileServiceImpl;
import kr.or.ddit.cmm.service.IAtchFileService;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.stay.service.IStayService;
import kr.or.ddit.stay.service.StayServiceImpl;
import kr.or.ddit.stay.vo.CoDetailVO;
import kr.or.ddit.stay.vo.StayVO;

/**
 * Servlet implementation class detailStay
 */
@WebServlet("/detailStay.do")
public class detailStay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detailStay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		
		String stay_id = request.getParameter("stay_id");
		
		IStayService service = StayServiceImpl.getInstance();
		
		StayVO vo = service.selectStay(stay_id);
		CoDetailVO covo = service.selectCoDetail(stay_id);
		
		// 첨부파일 정보 조회 이미지 파일을 꺼내기 위해
		if(vo.getAtch_file_id() > 0) {
			
			AtchFileVO fileVO = new AtchFileVO();
			
			fileVO.setAtchFileId(vo.getAtch_file_id());
			
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			
			List<AtchFileVO> atchFileList = fileService.getAtchFileList(fileVO);
			
				request.setAttribute("atchFileList", atchFileList);
			
		}
				// 3. request객체에 회원정보 저장
				request.setAttribute("stayList", vo);
				request.setAttribute("covo", covo);
				
				// 4. View 화면으로 이동
				request.getRequestDispatcher("stay/detailStay.jsp").forward(request, response);
				
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
