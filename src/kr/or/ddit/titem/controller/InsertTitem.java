package kr.or.ddit.titem.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.cmm.service.AtchFileServiceImpl;
import kr.or.ddit.cmm.service.IAtchFileService;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.titem.service.ITitemService;
import kr.or.ddit.titem.service.TitemServiceImpl;
import kr.or.ddit.titem.vo.TitemVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

/**
 * Servlet implementation class InsertTitem
 */
@WebServlet("/InsertTitem.do")
public class InsertTitem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTitem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//첨부파일이 있따면 업로드 시키고 끝나면 id만 받아서 그 정보를 mymember에 넣는다.
		
		AtchFileVO atchFileVO = new AtchFileVO();
		
		//multipart가 맞는지 확인...
		if(((FileUploadRequestWrapper)request).isMultipartContent()) {
			
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			
			
			Map<String, FileItem[]> fileItemMap = 
						((FileUploadRequestWrapper)request).getFileItemMap();
			
			System.out.println("파일 아이템 크기=>"+fileItemMap.size());
			
			if(fileItemMap.size()>0) {//파일이 존재하면...
				try {
					atchFileVO = fileService.saveAtchFileList(fileItemMap);
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
		}
		
		
		request.setCharacterEncoding("UTF-8");
		
		TitemVO vo = new TitemVO();
		
		int host_no = Integer.parseInt(request.getParameter("host_no"));
		String titem_div = request.getParameter("titem_div");
		String titem_name = request.getParameter("titem_name");
		String titem_info = request.getParameter("titem_info");
		int titem_price = Integer.parseInt(request.getParameter("titem_price"));
		int titem_people = Integer.parseInt(request.getParameter("titem_people"));
		
		vo.setAtch_file_id(atchFileVO.getAtchFileId());
		vo.setHost_no(host_no);
		vo.setTitem_div(titem_div);
		vo.setTitem_name(titem_name);
		vo.setTitem_info(titem_info);
		vo.setTitem_price(titem_price);
		vo.setTitem_people(titem_people);
		
		ITitemService service = TitemServiceImpl.getInstance();
		
		int num = service.insertTitem(vo);
		
		request.setAttribute("result", num);
		
		request.getRequestDispatcher("titem/result.jsp").forward(request, response);
		
	}

}
