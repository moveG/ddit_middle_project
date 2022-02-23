package kr.or.ddit.review.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.reser.vo.ReservationVO;
import kr.or.ddit.review.vo.ReviewAVO;
import kr.or.ddit.review.vo.ReviewVO;

public interface IReviewDao {
	//호스트 체크
	public int hostCheck(ReservationVO vo) throws SQLException;
	
	//예약 체크
	public int reserCheck(ReservationVO vo) throws SQLException;
	
	//작성자 체크
	public int writerCheck(ReviewVO vo) throws SQLException;
	
	//전체 리스트
	public List<ReviewVO> reviewList(String stay_id) throws SQLException;
	
	//리뷰 작성
	public int insertReview(ReviewVO vo) throws SQLException;
	
	//리뷰 수정
	public int updateReview(ReviewVO vo) throws SQLException;
	
	//리뷰 삭제
	public int deleteReview(int num) throws SQLException;
	
	//댓글 리스트
	public ReviewAVO replyList(int review_no) throws SQLException;
	
	//댓글 작성
	public int insertReply(ReviewAVO vo) throws SQLException;
	
	//댓글 수정
	public int updateReply(ReviewAVO vo) throws SQLException;
	
	//댓글 삭제
	public int deleteReply(int review_no) throws SQLException;
	
	//전체 리뷰 개수
	public int listCount() throws SQLException;
}
