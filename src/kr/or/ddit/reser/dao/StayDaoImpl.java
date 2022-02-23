package kr.or.ddit.reser.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;


import kr.or.ddit.reser.vo.CoVO;
import kr.or.ddit.reser.vo.ReserVO;
import kr.or.ddit.reser.vo.ReservationVO;
import kr.or.ddit.reser.vo.StayVO;
import kr.or.ddit.reser.vo.StayVO3;
import kr.or.ddit.stay.vo.MemberVO1;
import kr.or.ddit.util.SqlMapClientFactory;

public class StayDaoImpl implements IStayDao {
	private SqlMapClient smc;
	
	//싱글톤 패턴 적용
	private static IStayDao dao;
	private StayDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	public static IStayDao getInstance() {
		if(dao == null) {
			dao = new StayDaoImpl();
		}
		return dao;
	}
	
	//숙소 리스트
	@Override
	public List<StayVO> stayList() throws SQLException {
		return smc.queryForList("reservation.stayList");
	}
	
	//숙소 상세
	@Override
	public StayVO stayDetail(String stay_id) throws SQLException {
		return (StayVO) smc.queryForObject("reservation.stayDetail", stay_id);
	}

	
	//편의시설 리스트
	@Override
	public CoVO CoList(String stay_id) throws SQLException {
		return (CoVO) smc.queryForObject("reservation.coList", stay_id);
	}
	
	//예약
	@Override
	public String reservation(ReservationVO vo) throws SQLException {
		return (String) smc.insert("reservation.reservation", vo);
	}
	
	//장바구니 번호
	@Override
	public int cartNo(String mem_id) throws SQLException {
		return (Integer) smc.queryForObject("reservation.cartNo", mem_id);
	}
	
	//시간중복 체크
	@Override
	public int reserCheck(ReservationVO vo) throws SQLException {
		return (Integer) smc.queryForObject("reservation.reserCheck", vo);
	}
	
	//예약 취소1
	@Override
	public int reserCancel(String reser_no) throws SQLException {
		return (Integer) smc.update("reservation.reserCancel", reser_no);
	}
	
	//예약 취소2
	@Override
	public int reserCancelPeople(String reser_no) throws SQLException {
		return (Integer) smc.update("reservation.reserCancelPeople", reser_no);
	}
	
	//예약 ?
	@Override
	public List<ReservationVO> reserList(String stay_id) throws SQLException {
		return smc.queryForList("reservation.reserList", stay_id);
	}
	
	//예약 확인1
	@Override
	public int reserbutton(ReservationVO vo) throws SQLException {
		return (Integer) smc.queryForObject("reservation.reserButton", vo);
	}
	
	//예약 확인2
	@Override
	public ReservationVO reserbutton2(ReservationVO vo) throws SQLException {
		return (ReservationVO) smc.queryForObject("reservation.reserButton2", vo);
	}
	
	//호스트 이름
	@Override
	public String host_id(int host_no) throws SQLException {
		return (String) smc.queryForObject("reservation.host_id", host_no);
	}
	@Override
	public StayVO stayselectReStayDetail(String reser_no) throws SQLException {
		
		return (StayVO)smc.queryForObject("reservation.selectReStayDetail",reser_no);
	}
	@Override
	public ReservationVO selectReDetail(String reser_no) throws SQLException {
		return (ReservationVO)smc.queryForObject("reservation.selectReDetail",reser_no);
	}
	@Override
	public int RePeople(String reser_no) throws SQLException {
		
		return (Integer)smc.queryForObject("reservation.RePeople",reser_no);
	}
	@Override
	public MemberVO1 MemInfo(String reser_no) throws SQLException {
		
		return (MemberVO1)smc.queryForObject("reservation.MemInfo",reser_no);
	}
	@Override
	public List<ReserVO> ChartStay(int host_no) throws SQLException {
		
		return  (List<ReserVO>)smc.queryForList("reservation.ChartStay",host_no);
	}
	@Override
	public List<StayVO3> HostStay(int host_no) throws SQLException {
		// TODO Auto-generated method stub
		return (List<StayVO3>)smc.queryForList("reservation.HostStay",host_no);
	}
	@Override
	public int Price(String stay_id) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)smc.queryForObject("reservation.Price",stay_id);
	}
	@Override
	public ReserVO Last(int host_no) throws SQLException {
		// TODO Auto-generated method stub
		return (ReserVO)smc.queryForObject("reservation.Last",host_no);
	}
}
