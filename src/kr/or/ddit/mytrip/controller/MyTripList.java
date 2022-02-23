package kr.or.ddit.mytrip.controller;

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
import kr.or.ddit.mytrip.service.IMyTripService;
import kr.or.ddit.mytrip.service.MyTripServiceImpl;
import kr.or.ddit.mytrip.vo.MyTripVO;

/**
 * Servlet implementation class MyTripList
 */
@WebServlet("/MyTripList.do")
public class MyTripList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTripList() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMyTripService service = MyTripServiceImpl.getService();

		HttpSession session = request.getSession();

		String mem_id = "";
		mem_id = (String)session.getAttribute("mem_id");

		if(mem_id != null) {

			request.setAttribute("mem_id", mem_id);
		}

		System.out.println(mem_id);
		List<MyTripVO> list = service.myTripSelect();
		long []  ficnt = new long[list.size()];
		List<AtchFileVO>[] fileInfo = new List[list.size()];
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getAtch_file_id() > 0) {
				AtchFileVO fileVO = new AtchFileVO();
				fileVO.setAtchFileId(list.get(i).getAtch_file_id());
				//fileVO.setAtchFileId(246)	;
				IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				List<AtchFileVO> atchList = fileService.getAtchFileList(fileVO);
				ficnt[i] = atchList.size();
				fileInfo[i]=atchList;
				request.setAttribute("ficnt", ficnt);
				request.setAttribute("atchList", fileInfo);
			}
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/mytrip/mytripmain2.jsp").forward(request, response);
	}

}

