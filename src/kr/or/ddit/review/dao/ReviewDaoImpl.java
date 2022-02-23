package kr.or.ddit.review.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.reser.vo.ReservationVO;
import kr.or.ddit.review.vo.ReviewAVO;
import kr.or.ddit.review.vo.ReviewVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class ReviewDaoImpl implements IReviewDao {
	private SqlMapClient smc;
	
	//싱글톤 패턴 적용
	private static IReviewDao dao;
	private ReviewDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	public static IReviewDao getInstance() {
		if(dao == null) {
			dao = new ReviewDaoImpl();
		}
		return dao;
	}
	
	//호스트 체크
	@Override
	public int hostCheck(ReservationVO vo) throws SQLException {
		return (Integer) smc.queryForObject("review.hostCheck", vo);
	}
	
	//예약 체크
	@Override
	public int reserCheck(ReservationVO vo) throws SQLException {
		return (Integer) smc.queryForObject("review.reserCheck", vo);
	}
	
	//작성자 체크
	@Override
	public int writerCheck(ReviewVO vo) throws SQLException {
		return (Integer) smc.queryForObject("review.writerCheck", vo);
	}
	
	//전체리스트
	@Override
	public List<ReviewVO> reviewList(String stay_id) throws SQLException {
		return smc.queryForList("review.reviewList", stay_id);
	}

	//리뷰 작성
	@Override
	public int insertReview(ReviewVO vo) throws SQLException {
		return (Integer) smc.update("review.insertReview", vo);
	}
	
	//리뷰 수정
	@Override
	public int updateReview(ReviewVO vo) throws SQLException {
		return smc.update("review.updateReview", vo);
	}

	//리뷰 삭제
	@Override
	public int deleteReview(int num) throws SQLException {
		return smc.delete("review.deleteReview", num);
	}

	//댓글 리스트
	@Override
	public ReviewAVO replyList(int review_no) throws SQLException {
		return (ReviewAVO) smc.queryForObject("review.replyList", review_no);
	}

	//댓글 작성
	@Override
	public int insertReply(ReviewAVO vo) throws SQLException {
		return smc.update("review.insertReply", vo);
	}

	//댓글 수정
	@Override
	public int updateReply(ReviewAVO vo) throws SQLException {
		return smc.update("review.updateReply", vo);
	}

	//댓글 삭제
	@Override
	public int deleteReply(int review_no) throws SQLException {
		return smc.delete("review.deleteReply", review_no);
	}

	//전체 리뷰 개수
	@Override
	public int listCount() throws SQLException {
		return (Integer) smc.queryForObject("review.listCount");
	}
}
