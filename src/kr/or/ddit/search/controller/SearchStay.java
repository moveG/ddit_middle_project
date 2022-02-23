package kr.or.ddit.search.controller;

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
import kr.or.ddit.reser.vo.StayVO;
import kr.or.ddit.search.service.ISearchService;
import kr.or.ddit.search.service.SearchServiceImpl;
import kr.or.ddit.search.vo.SearchVO;

/**
 * Servlet implementation class SearchStay
 */
@WebServlet("/SearchStay.do")
public class SearchStay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchStay() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		if(mem_id == null) {
			mem_id = "비회원";
		}
		
		request.setCharacterEncoding("utf-8");
		String searchName = request.getParameter("search");
		
		System.out.println("검색:"+searchName);
		
		
		
		
		
		
		
		
		ISearchService service = SearchServiceImpl.getInstance();
		
		List<StayVO> list = service.selectSearchStay(searchName);
		List<AtchFileVO> atchList = new ArrayList<>();
		
		
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
		
		
		System.out.println("리스트 "+list.size());
		System.out.println("리스트 파일 아이디 "+list.get(0).getAtch_file_id());
		
		request.setAttribute("stayList", list);
		request.setAttribute("mem_id", mem_id);
		request.getRequestDispatcher("/reservation/stayList.jsp").forward(request, response);
	
	}


}
