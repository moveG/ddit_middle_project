package kr.or.ddit.mytrip.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.vo.HostVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.mytrip.vo.MyTripCommentVO;
import kr.or.ddit.mytrip.vo.MyTripVO;

public interface IMyTripDao {

	// 나만의 여행지 등록
	public int myTripInsert(MyTripVO vo) throws SQLException;

	// 구매 이력 조회
	public List<MyTripVO> myTripReservation(String mem_id) throws SQLException;

	// 나만의 여행지 삭제
	public int myTripDelete(int mytrip_no) throws SQLException;

	// 나만의 여행지 출력
	public List<MyTripVO> myTripSelect() throws SQLException;

	// 추천수 입력
	public int myTripSuggestion(int mytrip_no) throws SQLException;

	// 추천수 조회
	public int suggestionSelect(int mytrip_no) throws SQLException;

	// 댓글 조회
	public List<MyTripCommentVO> selectComment(int mytrip_no) throws SQLException;

	// 댓글 등록
	public int insertComment (MyTripCommentVO vo) throws SQLException;
	
	// 댓글 수정
	public int updateComment (MyTripCommentVO vo) throws SQLException;

	// 댓글 삭제
	public int commentDelete (int mytripc_no) throws SQLException;

	// 따라가기 버튼 상품디테일 이동을 위해 stay_id로 atch_file_id 검색
	public long myTripFollow (String stay_id) throws SQLException;
}
