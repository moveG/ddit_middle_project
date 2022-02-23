package kr.or.ddit.mytrip.controller;

import java.io.IOException;
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
import kr.or.ddit.mytrip.service.IMyTripService;
import kr.or.ddit.mytrip.service.MyTripServiceImpl;
import kr.or.ddit.mytrip.vo.MyTripVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

/**
 * Servlet implementation class MyTripInsert
 */
@WebServlet("/MyTripInsert.do")
public class MyTripInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTripInsert() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		AtchFileVO atchFileVO = new AtchFileVO();
		
		System.out.println((String)request.getParameter("mytrip_title"));
		System.out.println((String)request.getParameter("mytrip_content"));
		
		if(((FileUploadRequestWrapper)request).isMultipartContent()) {
			
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			
			
			Map<String, FileItem[]> fileItemMap = 
						((FileUploadRequestWrapper)request).getFileItemMap();
			
			
			if(fileItemMap.size()>0) {
				try {
					atchFileVO = fileService.saveAtchFileList(fileItemMap);
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
		}
		
		request.setCharacterEncoding("utf-8");
		
		MyTripVO vo = new MyTripVO();
		
		IMyTripService service = MyTripServiceImpl.getService();
		
		String mem_id = null;
		
		if(session.getAttribute("division").equals("guest")) {
			
		 mem_id = (String)session.getAttribute("mem_id"); 
		}
		//atch_file_id
		vo.setMem_id(mem_id);
		vo.setMytrip_title((String)request.getParameter("mytrip_title"));
		vo.setMytrip_content((String)request.getParameter("mytrip_content"));
		vo.setStay_id(request.getParameter("stay_id"));
		vo.setAtch_file_id(atchFileVO.getAtchFileId());
		
		int cnt = service.myTripInsert(vo);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/mytrip/insertCheck.jsp").forward(request, response);
		
	
	}

}
