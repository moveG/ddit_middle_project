package kr.or.ddit.gurlist.controller;

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
import kr.or.ddit.gurlist.service.GurListServiceImpl;
import kr.or.ddit.gurlist.service.IGurListService;
import kr.or.ddit.gurlist.vo.ReservationVO;

/**
 * Servlet implementation class GuestReserList
 */
@WebServlet("/GuestReserList.do")
public class GuestReserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuestReserList() {
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
		
		IGurListService service = GurListServiceImpl.getInstance();
		List<AtchFileVO> atchList = new ArrayList<>();
		List<ReservationVO> list = service.gurList(mem_id);
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getAtch_file_id() > 0) {
				AtchFileVO fileVO = new AtchFileVO();
				fileVO.setAtchFileId(list.get(i).getAtch_file_id());
				
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				atchList.add(fileService.getAtchList(fileVO));
			}
		}
		request.setAttribute("atchList", atchList);
		request.setAttribute("gurList", list);
		request.setAttribute("mem_id", mem_id);
		
		request.getRequestDispatcher("/guestReserList/guestReserList.jsp").forward(request, response);
	}
}
