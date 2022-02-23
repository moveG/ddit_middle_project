package kr.or.ddit.review.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.reser.vo.ReservationVO;
import kr.or.ddit.review.vo.ReviewAVO;
import kr.or.ddit.review.vo.ReviewVO;

public interface IReviewService {
	//호스트 체크
	public int hostCheck(ReservationVO vo);
	
	//예약 체크
	public int reserCheck(ReservationVO vo);
	
	//작성자 체크
	public int writerCheck(ReviewVO vo);
	
	//전체 리스트
	public List<ReviewVO> reviewList(String stay_id);
	
	//리뷰 작성
	public int insertReview(ReviewVO vo);
	
	//리뷰 수정
	public int updateReview(ReviewVO vo);
	
	//리뷰 삭제
	public int deleteReview(int num);
	
	//댓글 리스트
	public ReviewAVO replyList(int review_no);
	
	//댓글 작성
	public int insertReply(ReviewAVO vo); 
	
	//댓글 수정
	public int updateReply(ReviewAVO vo);
	
	//댓글 삭제
	public int deleteReply(int review_no);
	
	//전체 리뷰 개수
	public int listCount();
}
