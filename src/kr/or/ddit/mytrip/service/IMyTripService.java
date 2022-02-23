package kr.or.ddit.mytrip.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.vo.HostVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.mytrip.vo.MyTripCommentVO;
import kr.or.ddit.mytrip.vo.MyTripVO;

public interface IMyTripService {

	// 나만의 여행지 등록
	public int myTripInsert(MyTripVO vo);

	// 구매 이력 조회
	public List<MyTripVO> myTripReservation(String mem_id);

	// 나만의 여행지 삭제
	public int myTripDelete(int mytrip_no);

	// 나만의 여행지 출력
	public List<MyTripVO> myTripSelect();

	// 추천수 입력
	public int myTripSuggestion(int mytrip_no);

	// 추천수 조회
	public int suggestionSelect(int mytrip_no);

	// 댓글 조회
	public List<MyTripCommentVO> selectComment(int mytrip_no);

	// 댓글 등록
	public int insertComment (MyTripCommentVO vo);
	
	// 댓글 수정
	public int updateComment (MyTripCommentVO vo);

	// 댓글 삭제
	public int commentDelete (int mytripc_no);

	// 따라가기 버튼 상품디테일 이동을 위해 stay_id로 atch_file_id 검색
	public long myTripFollow (String stay_id);
}
