package kr.or.ddit.stay.controller;

import java.beans.Beans;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.net.ssl.SSLContextSpi;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.cmm.service.AtchFileServiceImpl;
import kr.or.ddit.cmm.service.IAtchFileService;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.stay.service.IStayService;
import kr.or.ddit.stay.service.StayServiceImpl;
import kr.or.ddit.stay.vo.CoDetailVO;
import kr.or.ddit.stay.vo.CoVO;
import kr.or.ddit.stay.vo.StayVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

/**
 * Servlet implementation class insertStay
 */
@WebServlet("/insertStay.do")
public class insertStay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertStay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

		//泥⑤��뙆�씪�씠 �엳�뵲硫� �뾽濡쒕뱶 �떆�궎怨� �걹�굹硫� id留� 諛쏆븘�꽌 洹� �젙蹂대�� mymember�뿉 �꽔�뒗�떎.
		
				AtchFileVO atchFileVO = new AtchFileVO();
				
				//multipart媛� 留욌뒗吏� �솗�씤...
				if(((FileUploadRequestWrapper)req).isMultipartContent()) {
					
					IAtchFileService fileService = AtchFileServiceImpl.getInstance();
					
					
					Map<String, FileItem[]> fileItemMap = 
								((FileUploadRequestWrapper)req).getFileItemMap();
					
					System.out.println("�뙆�씪 �븘�씠�뀥 �겕湲�=>"+fileItemMap.size());
					
					if(fileItemMap.size()>0) {//�뙆�씪�씠 議댁옱�븯硫�...
						try {
							atchFileVO = fileService.saveAtchFileList(fileItemMap);
						} catch (Exception e) {
							e.printStackTrace();
						} 
					}
				}
		 
				
				
				
				
				req.setCharacterEncoding("UTF-8");
			
			StayVO vo = new StayVO();
			

		/*	try {			
				BeanUtils.populate(vo, req.getParameterMap());
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			*/
			
			HttpSession session = req.getSession();
			
			int host_no = (Integer)session.getAttribute("host_no");
			
			System.out.println("숫자 아이디떠라"+host_no);
			
			
			
			
			String stay_name = req.getParameter("STAY_NAME");
			
			int stay_price = Integer.parseInt(req.getParameter("STAY_PRICE"));
			
			String stay_add1 = req.getParameter("STAY_ADD1");
			String stay_add2 = req.getParameter("STAY_ADD2");
			String stay_add3 = req.getParameter("STAY_ADD3");
			
			String stay_add = stay_add1+" "+stay_add2+" "+stay_add3;
			
			String stay_info= req.getParameter("STAY_INFO").replace("\n", "<br>");
			
			int stay_pnum = Integer.parseInt(req.getParameter("STAY_PNUM"));
			
			vo.setAtch_file_id(atchFileVO.getAtchFileId());
			vo.setHost_no(host_no);
			vo.setStay_add(stay_add);
			vo.setStay_info(stay_info);
			vo.setStay_name(stay_name);
			vo.setStay_pnum(stay_pnum);
			vo.setStay_price(stay_price);
			
			
			
			
			CoDetailVO covo = new CoDetailVO();
			
			
		if (req.getParameter("co_hair") != null) {
			int co_hair = Integer.parseInt(req.getParameter("co_hair"));
			covo.setCo_hair(co_hair);
		}

		if (req.getParameter("co_bath") != null) {
			int co_bath = Integer.parseInt(req.getParameter("co_bath"));
			covo.setCo_bath(co_bath);

		}
		if (req.getParameter("co_bidet") != null) {
			int co_bidet = Integer.parseInt(req.getParameter("co_bidet"));
			covo.setCo_bidet(co_bidet);

		}
		if (req.getParameter("co_water") != null) {

			int co_water = Integer.parseInt(req.getParameter("co_water"));
			covo.setCo_water(co_water);

		}

		if (req.getParameter("co_wash") != null) {
			int co_wash = Integer.parseInt(req.getParameter("co_wash"));

			covo.setCo_wash(co_wash);

		}

		if (req.getParameter("co_bed") != null) {
			int co_bed = Integer.parseInt(req.getParameter("co_bed"));
			covo.setCo_bed(co_bed);

		}
		if (req.getParameter("co_internet") != null) {
			int co_internet = Integer.parseInt(req.getParameter("co_internet"));
			covo.setCo_internet(co_internet);

		}

		if (req.getParameter("co_tem") != null) {
			int co_tem = Integer.parseInt(req.getParameter("co_tem"));
			covo.setCo_tem(co_tem);

		}

		if (req.getParameter("co_emer") != null) {
			int co_emer = Integer.parseInt(req.getParameter("co_emer"));
			covo.setCo_emer(co_emer);

		}

		if (req.getParameter("co_co") != null) {
			int co_co = Integer.parseInt(req.getParameter("co_co"));
			covo.setCo_co(co_co);

		}

		if (req.getParameter("co_re") != null) {
			int co_re = Integer.parseInt(req.getParameter("co_re"));
			covo.setCo_re(co_re);

		}

		if (req.getParameter("co_et") != null) {
			int co_et = Integer.parseInt(req.getParameter("co_et"));
			covo.setCo_et(co_et);

		}

		if (req.getParameter("co_gas") != null) {
			int co_gas = Integer.parseInt(req.getParameter("co_gas"));
			covo.setCo_gas(co_gas);

		}

		if (req.getParameter("co_rice") != null) {
			int co_rice = Integer.parseInt(req.getParameter("co_rice"));
			covo.setCo_rice(co_rice);

		}

		if (req.getParameter("co_park") != null) {
			int co_park = Integer.parseInt(req.getParameter("co_park"));
			covo.setCo_park(co_park);

		}
			
			
			
			//숙소 생성
			IStayService service = StayServiceImpl.getInstance();
			String co_id = service.insertCoDetail(covo);
			String stay_id = service.insertStay(vo);
			
			
			//편의 시설 생성
			CoVO coco = new CoVO();
			
			coco.setCo_id(co_id);
			coco.setStay_id(stay_id);
			
			String coco1 = service.insertCo(coco);
			
			
			req.setAttribute("stay_name", stay_name);
			req.setAttribute("result", coco1);
			req.getRequestDispatcher("stay/result.jsp").forward(req, response);
		
		
		
		
		
		
	}

}
