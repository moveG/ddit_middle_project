package kr.or.ddit.mytrip.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.vo.HostVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.mytrip.vo.MyTripCommentVO;
import kr.or.ddit.mytrip.vo.MyTripVO;
import kr.or.ddit.util.SqlMapClientFactory;


public class MyTripDaoImpl implements IMyTripDao{

	// sqlMap을 사용하기 위한 client 변수 선언
	private SqlMapClient client;

	private static IMyTripDao dao;

	private MyTripDaoImpl() {

		client = SqlMapClientFactory.getInstance();

	}

	public static IMyTripDao getDao() {

		if(dao == null) dao = new MyTripDaoImpl();

		return dao;

	}

	// 나만의 여행지 등록
	@Override
	public int myTripInsert(MyTripVO vo) throws SQLException {
		return (Integer)client.update("mytrip.myTripInsert", vo);
	}

	// 나만의 여행지 출력
	@Override
	public List<MyTripVO> myTripSelect() throws SQLException {
		return (List<MyTripVO>)client.queryForList("mytrip.myTripSelect");
	}

	// 추천수 입력
	@Override
	public int myTripSuggestion(int mytrip_no) throws SQLException {
		return (Integer)client.update("mytrip.myTripSuggestion", mytrip_no);
	}

	// 추천수 조회
	@Override
	public int suggestionSelect(int mytrip_no) throws SQLException {
		return (Integer)client.queryForObject("mytrip.suggestionSelect",mytrip_no);
	}

	// 댓글 조회
	@Override
	public List<MyTripCommentVO> selectComment(int mytrip_no) throws SQLException {
		return (List<MyTripCommentVO>)client.queryForList("mytrip.selectComment", mytrip_no);
	}

	// 첫번째 댓글 등록
	@Override
	public int insertComment(MyTripCommentVO vo) throws SQLException {
		return (Integer)client.update("mytrip.insertComment", vo);
	}

	// 구매 이력 조회
	@Override
	public List<MyTripVO> myTripReservation(String mem_id) throws SQLException {
		return(List<MyTripVO>)client.queryForList("mytrip.myTripReservation",mem_id);
	}

	// 따라가기 버튼 상품디테일 이동을 위해 stay_id로 atch_file_id 검색
	@Override
	public long myTripFollow(String stay_id) throws SQLException {
		return (long)client.queryForObject("mytrip.myTripFollow",stay_id);
	}

	// 나만의 여행지 삭제
	@Override
	public int myTripDelete(int mytrip_no) throws SQLException {
		return (Integer)client.delete("mytrip.myTripDelete",mytrip_no);
	}

	// 댓글 삭제
	@Override
	public int commentDelete(int mytripc_no) throws SQLException {
		return (Integer)client.delete("mytrip.commentDelete", mytripc_no);
	}
	
	// 댓글 수정
	@Override
	public int updateComment(MyTripCommentVO vo) throws SQLException {
		return (Integer)client.update("mytrip.updateComment",vo);
	}



}
