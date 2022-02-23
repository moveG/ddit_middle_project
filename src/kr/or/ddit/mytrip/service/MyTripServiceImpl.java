package kr.or.ddit.mytrip.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.HostVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.mytrip.dao.IMyTripDao;
import kr.or.ddit.mytrip.dao.MyTripDaoImpl;
import kr.or.ddit.mytrip.vo.MyTripCommentVO;
import kr.or.ddit.mytrip.vo.MyTripVO;

public class MyTripServiceImpl implements IMyTripService{

	private IMyTripDao dao;
	private static IMyTripService service;

	private MyTripServiceImpl() {

		dao = MyTripDaoImpl.getDao();

	}

	public static IMyTripService getService() {

		if(service == null) service = new MyTripServiceImpl();

		return service;
	}
	// 나만의 여행지 등록
	@Override
	public int myTripInsert(MyTripVO vo) {

		int cnt = 0;

		try {
			cnt = dao.myTripInsert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}

	// 나만의 여행지 출력
	@Override
	public List<MyTripVO> myTripSelect() {
		List<MyTripVO> list = null;

		try {
			list = dao.myTripSelect();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	// 추천수 입력
	@Override
	public int myTripSuggestion(int mytrip_no) {

		int cnt = 0;

		try {
			cnt = dao.myTripSuggestion(mytrip_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}

	// 추천수 조회
	@Override
	public int suggestionSelect(int mytrip_no) {

		int reno = 0;
		try {
			reno = dao.suggestionSelect(mytrip_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return reno;
	}

	// 댓글 조회
	@Override
	public List<MyTripCommentVO> selectComment(int mytrip_no) {

		List<MyTripCommentVO> list = null;

		try {
			list = dao.selectComment(mytrip_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	// 첫번째 댓글 등록
	@Override
	public int insertComment(MyTripCommentVO vo) {

		int cnt = 0;

		try {
			cnt = dao.insertComment(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	// 구매 이력 조회
	@Override
	public List<MyTripVO> myTripReservation(String mem_id) {

		List<MyTripVO> list = null;

		try {
			list = dao.myTripReservation(mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 따라가기 버튼 상품디테일 이동을 위해 stay_id로 atch_file_id 검색
	@Override
	public long myTripFollow(String stay_id) {
		long atch_file_id = 0;
		try {
			atch_file_id = dao.myTripFollow(stay_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return atch_file_id;
	}

	// 나만의 여행지 삭제
	@Override
	public int myTripDelete(int mytrip_no) {

		int cnt = 0;

		try {
			cnt = dao.myTripDelete(mytrip_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	// 댓글 삭제
	@Override
	public int commentDelete(int mytripc_no) {

		int cnt = 0;

		try {
			cnt = dao.commentDelete(mytripc_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 댓글 수정
	@Override
	public int updateComment(MyTripCommentVO vo) {
		
		int cnt = 0;
		
		try {
			cnt = dao.updateComment(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}


}
