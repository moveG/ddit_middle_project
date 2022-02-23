package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.catalina.connector.ClientAbortException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.member.vo.HostVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.SqlMapClientFactory;


public class MemberDaoImpl implements IMemberDao{
	
	// sqlMap을 사용하기 위한 client 변수 선언
	private SqlMapClient client;
	
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
		
		client = SqlMapClientFactory.getInstance();
		
	}
	
	public static IMemberDao getDao() {
		
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
		
	}
	
	// 중복 아이디 체크
	@Override 
	public String memberCheck(String mem_id) throws SQLException {
		return (String)client.queryForObject("member.memberCheck",mem_id);
	}
	
	// 게스트 회원가입
	@Override
	public String guestInsert(MemberVO vo) throws SQLException {
		return (String)client.insert("member.guestInsert", vo);
	}
	
	// 호스트 회원가입
	@Override
	public String hostInsert(MemberVO vo) throws SQLException {
		return (String)client.insert("member.hostInsert", vo);
	}
	
	// 로그인 
	@Override
	public int loginCheck(MemberVO vo) throws SQLException {
		return (Integer)client.queryForObject("member.loginCheck", vo);
	}
	
	// 세션 저장을 위한 게스트 호스트 구분
	@Override
	public HostVO memberDivision(String mem_id) throws SQLException {
		return (HostVO)client.queryForObject("member.memberDivision",mem_id);
	}
	
	// 아이디 찾기
	@Override
	public String idFind(MemberVO vo) throws SQLException {
		return (String)client.queryForObject("member.idFind", vo);
	}
	
	// PW찾기 (정보확인)
	@Override
	public MemberVO pwFind(MemberVO vo) throws SQLException {
		return (MemberVO)client.queryForObject("member.pwFind", vo);
	}

	@Override
	public int tampPassword(MemberVO vo) throws SQLException {
		return (Integer)client.update("member.tampPassword", vo);
	}

	@Override
	public String insertCart(String mem_id) throws SQLException {
		
		
		return (String)client.insert("member.insertCart", mem_id);
	}

	@Override
	public int selectMember(String mem_id) throws SQLException {
		
		return (Integer)client.queryForObject("member.selectMember",mem_id);
	}

	@Override
	public int checkHost(String mem_id) throws SQLException {
		
		
		return (Integer)client.queryForObject("member.checkHost",mem_id);
	}

	@Override
	public MemberVO selectMemberList(String mem_id) throws SQLException {
		
		return (MemberVO)client.queryForObject("member.selectMemberList",mem_id);
	}

	@Override
	public int updateMember(MemberVO vo) throws SQLException {
		
		return (Integer)client.update("member.updateMember",vo);
	}
	


}
