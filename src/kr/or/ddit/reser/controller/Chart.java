package kr.or.ddit.reser.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reser.service.IStayService;
import kr.or.ddit.reser.service.StayServiceImpl;
import kr.or.ddit.reser.vo.ReserVO;
import kr.or.ddit.review.service.IReviewService;

/**
 * Servlet implementation class Chart
 */
@WebServlet("/Chart.do")
public class Chart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Chart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int host_no = 62;
		
		IStayService service = StayServiceImpl.getInstance();
		List<ReserVO> Clist = service.ChartStay(host_no);
		int[] date = new int[32];
		boolean flag = false;
		
		Map<Integer,Integer> Cmap = new HashMap<Integer, Integer>();
		
		
		
		
		
	
		
	/*	for(int i=0; i<Clist.size();i++) {
			
			//10월 체크인 만 가능하게
			if(Clist.get(i).getReser_ckin().substring(5,7).equals("10")) {
				
				Clist.get(i).getReser_ckin().substring(8,10) /Clist.get(i).getReser_price() 
						
		Cmap.put(Integer.parseInt(Clist.get(i).getReser_ckin().substring(8,10)), Clist.get(i).getReser_price());
					
				}//10월 체크인 만 가능하게
			
				
			}//사이즈 for문
*/		
		
		for(int i=1; i<date.length;i++) {
			
			int price = 0;
			for(int k=0; k<Clist.size();k++) {
				if ( Clist.get(i).getReser_ckin().substring(5,7).equals("10") && i == Integer.parseInt(Clist.get(k).getReser_ckin().substring(8,10)));
				
				{
				price += Clist.get(k).getReser_price();
				System.out.println("price"+price);
				}
				
				date[i] = price;
			}
		
			
			
			
			
			
		}//일자 데이터 for 문
		
		
		
		
		
		/*
			for(int i = 0 ; 30)
				price = 0; 
				for(v) {
				
				if ( i == Clist.get(v).getReser_ckin().substring(8,10) && Clist.get(i).getReser_ckin().substring(5,7).equals("10"))
				price += Clist.get(v).getReser_price() 
				}
				date[i] = price;*/
		
		
		
			
		/*	for(int i=0; i<date.length;i++) {
				
				for(Integer key : Cmap.keySet())
				
				{
					
					if(i == key) {
						
						date[i] = Cmap.get(key);
						
					}
				
				}

				
				
			}
			*/
			
	
		
		//
	
		
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
