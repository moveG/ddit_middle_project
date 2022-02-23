package kr.or.ddit.notice.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapException;

import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class NoticeDaoImpl implements INoticeDao{

	private static INoticeDao dao;
	
	private SqlMapClient smc;
	
	private NoticeDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static INoticeDao getInstance() {
		if(dao == null) {
			dao = new NoticeDaoImpl();
		}
		return dao;
	}

	@Override
	public int insertNotice(NoticeVO vo) throws SQLException {
		return (Integer)smc.insert("notice.insertNotice", vo);
	}

	@Override
	public int updateNotice(NoticeVO vo) throws SQLException {
		return (Integer)smc.update("notice.updateNotice", vo);
	}

	@Override
	public NoticeVO selectNotice(int notice_no) throws SQLException {
		return (NoticeVO)smc.queryForObject("notice.selectNotice", notice_no);
	}

	@Override
	public int deleteNotice(int notice_no) throws SQLException {
		return smc.delete("notice.deleteNotice", notice_no);
	}

	@Override
	public List<NoticeVO> selectAllNotice() throws SQLException {
		return smc.queryForList("notice.selectAllNotice");
	}

	

	
	
	
	
}
