package kr.or.ddit.event.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.event.vo.EventVO;



public interface IEventDao {
	

		//모든 이벤트 글 출력
		public List<EventVO> selectAllEventBoard();
		
		//글 작성
		public String insertEventBoard(EventVO vo);
		
		//글 상세 보기
		public EventVO selectEventBoard(int EventBoardNum);

		
		
		
		
		
		
		
}
