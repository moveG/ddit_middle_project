package kr.or.ddit.faq.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.faq.vo.FaqVO;
import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class FaqDaoImpl implements IFaqDao{
	private static IFaqDao dao;
	
	private SqlMapClient smc;
	
	private FaqDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IFaqDao getInstance() {
		if(dao == null) {
			dao = new FaqDaoImpl();
		}
		return dao;
	}

	@Override
	public List<FaqVO> selectAllFaq() throws SQLException {
		return smc.queryForList("faq.selectAllFaq");
	}

	@Override
	public FaqVO selectFaq(int faq_no) throws SQLException {
		return (FaqVO)smc.queryForObject("faq.selectFaq", faq_no);
	}
	
	
}
