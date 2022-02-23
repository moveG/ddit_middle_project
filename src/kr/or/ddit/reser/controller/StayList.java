package kr.or.ddit.reser.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import kr.or.ddit.reser.vo.StayVO;

/**
 * Servlet implementation class StayList
 */
@WebServlet("/reservation/StayList.do")
public class StayList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StayList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		if(mem_id == null) {
			mem_id = "비회원";
		}
		
		IStayService service = StayServiceImpl.getInstance();
		List<AtchFileVO> atchList = new ArrayList<>();
		List<StayVO> list = service.stayList();
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getAtch_file_id() > 0) {
				
				AtchFileVO fileVO = new AtchFileVO();
				System.out.println(list.get(i).getAtch_file_id());
				fileVO.setAtchFileId(list.get(i).getAtch_file_id());
				
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				atchList.add(fileService.getAtchList(fileVO));
				
			}
		}
		
		request.setAttribute("atchList", atchList);
		
		request.setAttribute("stayList", list);
		request.setAttribute("mem_id", mem_id);
		request.getRequestDispatcher("/reservation/stayList.jsp").forward(request, response);
		
	}
}
