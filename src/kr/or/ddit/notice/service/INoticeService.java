package kr.or.ddit.notice.service;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapException;

import kr.or.ddit.notice.vo.NoticeVO;

public interface INoticeService {
	
	//공지사항 작성
	public int insertNotice(NoticeVO vo);
	
	//공지사항 수정
	public int updateNotice(NoticeVO vo);
	
	//공지사항 삭제
	public int deleteNotice(int notice_no);
	
	//공지사항 번호에 맞는 글정보 출력
	public NoticeVO selectNotice(int notice_no);
	
	//전체 공지사항 리스트 출력
	public List<NoticeVO> selectAllNotice();

}
