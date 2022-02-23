package kr.or.ddit.faq.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.faq.vo.FaqVO;

public interface IFaqDao {

	//자주묻는질문 리스트 출력
	public List<FaqVO> selectAllFaq() throws SQLException;
	
	//자주묻는질문 개별 조회
	public FaqVO selectFaq(int faq_no) throws SQLException;
	
}
