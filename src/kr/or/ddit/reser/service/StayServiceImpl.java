package kr.or.ddit.reser.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.reser.dao.IStayDao;
import kr.or.ddit.reser.dao.StayDaoImpl;
import kr.or.ddit.reser.vo.CoVO;
import kr.or.ddit.reser.vo.ReserVO;
import kr.or.ddit.reser.vo.ReservationVO;
import kr.or.ddit.reser.vo.StayVO;
import kr.or.ddit.reser.vo.StayVO3;
import kr.or.ddit.stay.vo.MemberVO1;

public class StayServiceImpl implements IStayService {
	private IStayDao dao;
	
	//싱글톤 패턴 적용
	private static IStayService service;
	private StayServiceImpl() {
		dao = StayDaoImpl.getInstance();
	}
	public static IStayService getInstance() {
		if(service == null) {
			service = new StayServiceImpl();
		}
		return service;
	}
	
	//숙소 리스트
	@Override
	public List<StayVO> stayList() {
		List<StayVO> list = null;
		
		try {
			list = dao.stayList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//숙소 상세
	@Override
	public StayVO stayDetail(String stay_id) {
		StayVO vo= null;
		
		try {
			vo = dao.stayDetail(stay_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	//편의시설 리스트
	@Override
	public CoVO CoList(String stay_id) {
		CoVO vo = null;
		
		try {
			vo = dao.CoList(stay_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	//장바구니 번호
	@Override
	public int cartNo(String mem_id) {
		int cartNo = 0;
		
		try {
			cartNo = dao.cartNo(mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartNo;
	}
	
	//예약
	@Override
	public String reservation(ReservationVO vo) {
		String num = "";
		
		try {
			num = dao.reservation(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//시간중복 체크
	@Override
	public int reserCheck(ReservationVO vo) {
		int num = 0;
		
		try {
			num = dao.reserCheck(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//예약 취소1
	@Override
	public int reserCancel(String reser_no) {
		int num = 0;
		
		try {
			num = dao.reserCancel(reser_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//예약 취소2
	@Override
	public int reserCancelPeople(String reser_no) {
		int num = 0;
		
		try {
			num = dao.reserCancelPeople(reser_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//예약 리스트
	@Override
	public List<ReservationVO> reserList(String stay_id) {
		List<ReservationVO> list = null;
		try {
			list = dao.reserList(stay_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//예약 확인1
	@Override
	public int reserbutton(ReservationVO vo) {
		int num = 0;
		
		try {
			num = dao.reserbutton(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//예약 확인2
	@Override
	public ReservationVO reserbutton2(ReservationVO vo) {
		ReservationVO vo2 = null;
		
		try {
			vo2 = dao.reserbutton2(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo2;
	}
	
	//호스트 이름
	@Override
	public String host_id(int host_no) {
		String id = null;
		
		try {
			id = dao.host_id(host_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	@Override
	public StayVO stayselectReStayDetail(String reser_no){
		StayVO vo = null;
		
		try {
			vo = dao.stayselectReStayDetail(reser_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	@Override
	public ReservationVO selectReDetail(String reser_no){
		
		ReservationVO vo = null;
		
		try {
			vo = dao.selectReDetail(reser_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	@Override
	public int RePeople(String reser_no) {
		
		int cnt = 0;
		
		
		try {
			cnt = dao.RePeople(reser_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}
	@Override
	public MemberVO1 MemInfo(String reser_no) {
		
		MemberVO1 vo = null;
		
		try {
			vo = dao.MemInfo(reser_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return vo;
	}
	@Override
	public List<ReserVO> ChartStay(int host_no) {
		
		List<ReserVO> list = null;
		
		try {
			list = dao.ChartStay(host_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}
	@Override
	public List<StayVO3> HostStay(int host_no){
		List<StayVO3> vo = null;
		
		try {
			vo = dao.HostStay(host_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	@Override
	public int Price(String stay_id)  {
		int cnt =0;
		
		try {
			cnt = dao.Price(stay_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public ReserVO Last(int host_no) {
		
		
		ReserVO list = null;
		
		try {
			list = dao.Last(host_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}
}
