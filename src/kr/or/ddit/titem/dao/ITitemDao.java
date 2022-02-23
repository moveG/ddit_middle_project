package kr.or.ddit.titem.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.titem.vo.TitemVO;

public interface ITitemDao {
	
	public int insertTitem(TitemVO vo) throws SQLException;
	
}
