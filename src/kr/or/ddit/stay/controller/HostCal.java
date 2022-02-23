package kr.or.ddit.stay.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.stay.service.IStayService;
import kr.or.ddit.stay.service.StayServiceImpl;
import kr.or.ddit.stay.vo.StayCalVO;

/**
 * Servlet implementation class HostCal
 */
@WebServlet("/HostCal.do")
public class HostCal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostCal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		/*HttpSession session = request.getSession();
		
		int host_no = (Integer)session.getAttribute("host_no");
		System.out.println("호스트 no떠라"+host_no);*/
		int host_no = Integer.parseInt(request.getParameter("host_no"));
		
		System.out.println("호스트 넘"+host_no);
		
		IStayService service = StayServiceImpl.getInstance();
		
		/*List<String> hoStay = new ArrayList<String>();
		StayCalVO calVO = new StayCalVO();
		List<StayCalVO> calList = new ArrayList<StayCalVO>();
		
		System.out.println("호스트 ㅜㅠㅐ"+host_no);
		if(service.selectHostStayId(host_no)!=null) {
				hoStay = service.selectHostStayId(host_no);
			}
		//호스트 아이디에 대해 숙소 정보가 있을 때 
		if(hoStay != null) {
			
			//숙소 아이디에 맞는 예약된 stay_name 체크인, 체크아웃 출력 
			for(int i=0; i<hoStay.size(); i++) {
				
				if(service.selectStayName(hoStay.get(i))!= null) {
					calList.add(service.selectStayName(hoStay.get(i)).get(i));
				}
			}
		*/
		
			List<StayCalVO> calList = new ArrayList<StayCalVO>();
			calList = service.selectStayName(host_no);
		
		
		
			System.out.println("호스트 스테이 네ㅐ임"+calList.get(0).getStay_name());
			request.setAttribute("calList", calList);
			
			request.getRequestDispatcher("cal/HostList.jsp").forward(request, response);
			
			
			
		
		}//숙소가 있을 때
		
		
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
