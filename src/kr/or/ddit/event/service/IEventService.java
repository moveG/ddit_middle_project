package kr.or.ddit.event.service;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapException;

import kr.or.ddit.event.vo.EventVO;


public interface IEventService {
	
	
	//모든 이벤트 글 출력
	public List<EventVO> selectAllEventBoard();
	
	//글 작성
	public String insertEventBoard(EventVO vo);
	
	//글 상세 보기
	public EventVO selectEventBoard(int EventBoardNum);
	
	
	
	
	
	
}
