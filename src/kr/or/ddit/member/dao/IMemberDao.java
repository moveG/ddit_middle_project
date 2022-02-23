package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.member.vo.HostVO;
import kr.or.ddit.member.vo.MemberVO;

public interface IMemberDao {
	
	// 회원가입 시 중복ID를 막기위한 ID체크
	public String memberCheck(String mem_id) throws SQLException;
	
	// 회원가입 
	public String guestInsert(MemberVO vo) throws SQLException;
	
	// 호스트 회원가입
	public String hostInsert(MemberVO vo) throws SQLException;
	
	// 로그인
	public int loginCheck(MemberVO vo) throws SQLException;
	
	// 세션 저장을 위한 게스트 호스트 구분
	public HostVO memberDivision(String mem_id) throws SQLException;
	
	// ID찾기
	public String idFind(MemberVO vo) throws SQLException;
	
	// PW찾기 (정보 조회)
	public MemberVO pwFind(MemberVO vo) throws SQLException;
	
	// 임시 비밀번호 발급 및 업데이트
	public int tampPassword (MemberVO vo) throws SQLException;
	
	// 석기현 회원 가입 시 카트 번호 자동 생성
	public String insertCart(String mem_id) throws SQLException;
	
	// 석기현 비회원 판별
	public int selectMember(String mem_id) throws SQLException;
	
	// 석기현 호스트 체크
	public int checkHost(String mem_id) throws SQLException;
	
	// 석기현 멤버 아이디 정보 추출(회원 정보를 수정하기 위한)
	public MemberVO selectMemberList(String mem_id) throws SQLException;
	
	// 석기현 멤버 아이디 정보 변경
	public int updateMember(MemberVO vo) throws SQLException;
	
	
}
