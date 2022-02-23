package kr.or.ddit.reser.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.reser.service.IStayService;
import kr.or.ddit.reser.service.StayServiceImpl;
import kr.or.ddit.reser.vo.ReserVO;
import kr.or.ddit.reser.vo.StayVO;
import kr.or.ddit.reser.vo.StayVO3;

/**
 * Servlet implementation class CirChart
 */
@WebServlet("/CirChart.do")
public class CirChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CirChart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		int host_no = (Integer)session.getAttribute("host_no");
		
		
		
		IStayService service = StayServiceImpl.getInstance();
		
		List<StayVO3> vo = null;
		
		
		Map<String, Integer> Cmap = new HashMap<String, Integer>();
		
		
		
		vo = service.HostStay(host_no);
		System.out.println(vo.get(0).getStay_name());
		for(int i=0; i<vo.size();i++) {
			
			Cmap.put(vo.get(i).getStay_name(), service.Price(vo.get(i).getStay_id()));
			
		}
		
		
		//그냥 차트
		List<ReserVO> Clist = service.ChartStay(host_no);
		int[] date = new int[32];
		boolean flag = false;
		
		Map<Integer,Integer> Cmap1 = new HashMap<Integer, Integer>();
		
		
		/*for(int i=0; i<Clist.size();i++) {
			
			//10월 체크인 만 가능하게
			if(Clist.get(i).getReser_ckin().substring(5,7).equals("10")) {
				
				
					
						
				Cmap1.put(Integer.parseInt(Clist.get(i).getReser_ckin().substring(8,10)), Clist.get(i).getReser_price());
						
					
					
					
				}//10월 체크인 만 가능하게
			
				
				
				
			}//사이즈 for문
*/			
			/*for(int i=0; i<date.length;i++) {
				
				for(Integer key : Cmap1.keySet())
				
				{
					
					if(i == key) {
						
						date[i] = Cmap1.get(key);
						
					}
				
				}

				
				
			}*/
			
		for(int i=1; i<date.length;i++) {
			
			int price = 0;
			for(int k=0; k<Clist.size();k++) {
				if ( Clist.get(k).getReser_ckin().substring(5,7).equals("10") 
						&& (i == Integer.parseInt(Clist.get(k).getReser_ckin().substring(8,10))))
				
				{
					System.out.println("찎혀라"+Clist.get(k).getReser_ckin().substring(5,7).equals("10"));
					price += Clist.get(k).getReser_price();
					System.out.println("i:"+i+" k:"+k+" price: "+price);
				}
				
			
			}
		
			date[i] = price;
			System.out.println("data:"+date[i]);
		}
		
		//최고 수익 금액, 이름 추출
		ReserVO ReserVO1 = null;
		ReserVO1 = service.Last(host_no);
		
		
		request.setAttribute("stayvo", ReserVO1);
		request.setAttribute("chart", date);
		request.setAttribute("cirChart",Cmap);
		request.getRequestDispatcher("stats/stats_main.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
