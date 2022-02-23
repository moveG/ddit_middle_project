package kr.or.ddit.reser.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.reser.vo.CoVO;
import kr.or.ddit.reser.vo.ReserVO;
import kr.or.ddit.reser.vo.ReservationVO;
import kr.or.ddit.reser.vo.StayVO;
import kr.or.ddit.reser.vo.StayVO3;
import kr.or.ddit.stay.vo.MemberVO1;

public interface IStayService {
	//숙소 리스트
	public List<StayVO> stayList();
	
	//숙소 상세
	public StayVO stayDetail(String stay_id);
	
	//편의시설 리스트
	public CoVO CoList(String stay_id);
	
	//예약 등록
	public String reservation(ReservationVO vo);
	
	//장바구니 번호
	public int cartNo(String mem_id);
	
	//시간중복 체크
	public int reserCheck(ReservationVO vo);
	
	//예약 취소1
	public int reserCancel(String reser_no);
	
	//예약 취소2
	public int reserCancelPeople(String reser_no);
	
	//예약 리스트
	public List<ReservationVO> reserList(String stay_id);
	
	//예약 확인
	public int reserbutton(ReservationVO vo);
	
	//예약 확인2
	public ReservationVO reserbutton2(ReservationVO vo);
	
	//호스트 이름
	public String host_id(int host_no);
	
	//석기현 예약번호에 맞는 숙소 정보 조회
	public StayVO stayselectReStayDetail(String reser_no);
	
	//석기현 예약번호에 맞는 예약정보 출력
	public ReservationVO selectReDetail(String reser_no);
	
	//석기현 예약 번호에 맞는 인원 수 출력
	public int RePeople(String reser_no);  
	
	//석기현 예약 번호에 맞는 멤버 정보 출력
	public MemberVO1 MemInfo(String reser_no);
	
	//석기현 그래프 정보 출력
	public List<ReserVO> ChartStay(int host_no);
	
	public List<StayVO3> HostStay(int host_no);
	
	public int Price(String stay_id) ;
	
	public ReserVO Last(int host_no) ;
	
	
}
