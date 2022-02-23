package kr.or.ddit.faq.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.faq.dao.FaqDaoImpl;
import kr.or.ddit.faq.dao.IFaqDao;
import kr.or.ddit.faq.vo.FaqVO;
import kr.or.ddit.notice.vo.NoticeVO;

public class FaqServiceImpl implements IFaqService{

	private static IFaqService service;
	
	public static IFaqService getInstance() {
		if(service == null) {
			service = new FaqServiceImpl();
		}
		return service;
	}
	
	private IFaqDao dao;
	
	private FaqServiceImpl() {
		dao = FaqDaoImpl.getInstance();
	}

	@Override
	public List<FaqVO> selectAllFaq() {
		List<FaqVO> list = null;
		
		try {
			list = dao.selectAllFaq();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public FaqVO selectFaq(int faq_no) {
		FaqVO vo = new FaqVO();
		
		try {
			vo = dao.selectFaq(faq_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	
}
