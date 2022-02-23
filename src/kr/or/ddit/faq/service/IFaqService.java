package kr.or.ddit.faq.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.faq.vo.FaqVO;

public interface IFaqService {
	
	//자주묻는질문 리스트 출력
	public List<FaqVO> selectAllFaq();
		
	//자주묻는질문 개별 조회
	public FaqVO selectFaq(int faq_no);

}
