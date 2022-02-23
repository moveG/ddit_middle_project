package kr.or.ddit.review.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.reser.vo.ReservationVO;
import kr.or.ddit.review.dao.IReviewDao;
import kr.or.ddit.review.dao.ReviewDaoImpl;
import kr.or.ddit.review.vo.ReviewAVO;
import kr.or.ddit.review.vo.ReviewVO;

public class ReviewServiceImpl implements IReviewService {
	private IReviewDao dao;
	
	//싱글톤 패턴 적용
	private static IReviewService service;
	private ReviewServiceImpl() {
		dao = ReviewDaoImpl.getInstance();
	}
	public static IReviewService getInstance() {
		if(service == null) {
			service = new ReviewServiceImpl();
		}
		return service;
	}

	//호스트 체크
	@Override
	public int hostCheck(ReservationVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.hostCheck(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//예약 체크
	@Override
	public int reserCheck(ReservationVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.reserCheck(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//작성자 체크
	@Override
	public int writerCheck(ReviewVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.writerCheck(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//전체 리스트
	@Override
	public List<ReviewVO> reviewList(String stay_id) {
		List<ReviewVO> list = null;
		
		try {
			list = dao.reviewList(stay_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//리뷰 작성
	@Override
	public int insertReview(ReviewVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.insertReview(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	//리뷰 수정
	@Override
	public int updateReview(ReviewVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.updateReview(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	//리뷰 삭제
	@Override
	public int deleteReview(int num) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteReview(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	//댓글 리스트
	@Override
	public ReviewAVO replyList(int review_no) {
		ReviewAVO vo = null;
		
		try {
			vo = dao.replyList(review_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	//댓글 작성
	@Override
	public int insertReply(ReviewAVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.insertReply(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	//댓글 수정
	@Override
	public int updateReply(ReviewAVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.updateReply(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	//댓글 삭제
	@Override
	public int deleteReply(int review_no) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteReply(review_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	//전체 리뷰 개수
	@Override
	public int listCount() {
		int cnt = 0;
		
		try {
			cnt = dao.listCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
}
