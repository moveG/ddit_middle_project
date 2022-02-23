package kr.or.ddit.stay.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.cmm.service.AtchFileServiceImpl;
import kr.or.ddit.cmm.service.IAtchFileService;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.stay.service.IStayService;
import kr.or.ddit.stay.service.StayServiceImpl;
import kr.or.ddit.stay.vo.StayVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

/**
 * Servlet implementation class ListStay
 */
@WebServlet("/ListStay.do")
public class ListStay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListStay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//세션이나 request로 호스트 아이디 가지고 와야함
		HttpSession session = request.getSession();
		
		int host_no = (Integer)session.getAttribute("host_no");
		System.out.println("호스트 no떠라"+host_no);
		
		
		List<AtchFileVO> atchList = new ArrayList<>();

		IStayService service = StayServiceImpl.getInstance();
		List<StayVO> list = service.selectAllStay(host_no);
		
		
	
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
		
		request.setAttribute("stayAllList", list);
		
		request.getRequestDispatcher("/stay/selectStay.jsp").forward(request, response);
		
		
		
		
		
	}

}
