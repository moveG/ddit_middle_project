package kr.or.ddit.stay.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.cmm.service.AtchFileServiceImpl;
import kr.or.ddit.cmm.service.IAtchFileService;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.stay.service.IStayService;
import kr.or.ddit.stay.service.StayServiceImpl;
import kr.or.ddit.stay.vo.CoDetailVO;
import kr.or.ddit.stay.vo.StayVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

/**
 * Servlet implementation class updateStay
 */
@WebServlet("/updateStay.do")
public class updateStay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateStay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String stay_id = request.getParameter("stay_id");
		System.out.println("updateget아이디 떠라: "+stay_id);
		IStayService service = StayServiceImpl.getInstance();
		
		StayVO vo = service.selectStay(stay_id);
		CoDetailVO covo = service.selectCoDetail(stay_id);
		if(vo.getAtch_file_id()>0) {
		
			AtchFileVO fileVO = new AtchFileVO();
			fileVO.setAtchFileId(vo.getAtch_file_id());
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			List<AtchFileVO> atchFileList = fileService.getAtchFileList(fileVO);
			request.setAttribute("atchFileList", atchFileList);
			
		}
		
		request.setAttribute("codetail", covo);
		request.setAttribute("stay", vo);
		
		// 4. View 화면으로 이동
		request.getRequestDispatcher("stay/updateStay.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		AtchFileVO atchFileVO = new AtchFileVO();
		
		// 기존의 첨부파일 아이디 정보 가져와서 설정하기
		
		long atchFileId = request.getParameter("atchFileId") == null ?
				-1 : Long.parseLong(request.getParameter("atchFileId"));
		
		atchFileVO.setAtchFileId(atchFileId);
		
		if(((FileUploadRequestWrapper)request).isMultipartContent()) {
			
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			
			
			Map<String, FileItem[]> fileItemMap = 
						((FileUploadRequestWrapper)request).getFileItemMap();
			
			System.out.println("�뙆�씪 �븘�씠�뀥 �겕湲�=>"+fileItemMap.size());
			
			if(fileItemMap.size()>0) {
				try {
					atchFileVO = fileService.saveAtchFileList(fileItemMap);
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
		}
		
		
		
		
		StayVO vo = new StayVO();
		
		int host_no = Integer.parseInt(request.getParameter("HOST_NO"));
		String stay_name = request.getParameter("STAY_NAME");
		int stay_price = Integer.parseInt(request.getParameter("STAY_PRICE"));
		String stay_info= request.getParameter("STAY_INFO").replace("\n", "<br>");

		String stay_add1 = request.getParameter("STAY_ADD1");
		String stay_add2 = request.getParameter("STAY_ADD2");
		String stay_add3 = request.getParameter("STAY_ADD3");
		
		String stay_add = stay_add1+" "+stay_add2+" "+stay_add3;
		
		int stay_pnum = Integer.parseInt(request.getParameter("STAY_PNUM"));
		
		vo.setAtch_file_id(atchFileVO.getAtchFileId());
		vo.setHost_no(host_no);
		vo.setStay_add(stay_add);
		vo.setStay_info(stay_info);
		vo.setStay_name(stay_name);
		vo.setStay_pnum(stay_pnum);
		vo.setStay_price(stay_price);
		
				
		
		CoDetailVO covo = new CoDetailVO();
		
		
	if (request.getParameter("co_hair") != null) {
		int co_hair = Integer.parseInt(request.getParameter("co_hair"));
		covo.setCo_hair(co_hair);
	}

	if (request.getParameter("co_bath") != null) {
		int co_bath = Integer.parseInt(request.getParameter("co_bath"));
		covo.setCo_bath(co_bath);

	}
	if (request.getParameter("co_bidet") != null) {
		int co_bidet = Integer.parseInt(request.getParameter("co_bidet"));
		covo.setCo_bidet(co_bidet);

	}
	if (request.getParameter("co_water") != null) {

		int co_water = Integer.parseInt(request.getParameter("co_water"));
		covo.setCo_water(co_water);

	}

	if (request.getParameter("co_wash") != null) {
		int co_wash = Integer.parseInt(request.getParameter("co_wash"));

		covo.setCo_wash(co_wash);

	}

	if (request.getParameter("co_bed") != null) {
		int co_bed = Integer.parseInt(request.getParameter("co_bed"));
		covo.setCo_bed(co_bed);

	}
	if (request.getParameter("co_internet") != null) {
		int co_internet = Integer.parseInt(request.getParameter("co_internet"));
		covo.setCo_internet(co_internet);

	}

	if (request.getParameter("co_tem") != null) {
		int co_tem = Integer.parseInt(request.getParameter("co_tem"));
		covo.setCo_tem(co_tem);

	}

	if (request.getParameter("co_emer") != null) {
		int co_emer = Integer.parseInt(request.getParameter("co_emer"));
		covo.setCo_emer(co_emer);

	}

	if (request.getParameter("co_co") != null) {
		int co_co = Integer.parseInt(request.getParameter("co_co"));
		covo.setCo_co(co_co);

	}

	if (request.getParameter("co_re") != null) {
		int co_re = Integer.parseInt(request.getParameter("co_re"));
		covo.setCo_re(co_re);

	}

	if (request.getParameter("co_et") != null) {
		int co_et = Integer.parseInt(request.getParameter("co_et"));
		covo.setCo_et(co_et);

	}

	if (request.getParameter("co_gas") != null) {
		int co_gas = Integer.parseInt(request.getParameter("co_gas"));
		covo.setCo_gas(co_gas);

	}

	if (request.getParameter("co_rice") != null) {
		int co_rice = Integer.parseInt(request.getParameter("co_rice"));
		covo.setCo_rice(co_rice);

	}

	if (request.getParameter("co_park") != null) {
		int co_park = Integer.parseInt(request.getParameter("co_park"));
		covo.setCo_park(co_park);

	}
		
		
		String stay_id = request.getParameter("STAY_ID");
		String co_id = request.getParameter("CO_ID");
		System.out.println("stay_id"+stay_id);
		System.out.println("co_id"+co_id);
		
	 	vo.setStay_id(stay_id);
		covo.setCo_id(co_id);
		
		IStayService service = StayServiceImpl.getInstance();
		
		int stay =	service.updateStay(vo);
		int codetail = service.updateCoDetail(covo);
		
		request.setAttribute("codetail", codetail);
		request.setAttribute("stay", vo);
		
		request.getRequestDispatcher("stay/resultUpdate.jsp").forward(request, response);
		
		
		
		
	}

}
