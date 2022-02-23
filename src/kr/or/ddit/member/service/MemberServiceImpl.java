package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.HostVO;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService{

	private IMemberDao dao;
	private static IMemberService service;
	
	private MemberServiceImpl() {
		
		dao = MemberDaoImpl.getDao();
		
	}
	
	public static IMemberService getService() {
		
		if(service == null) service = new MemberServiceImpl();
		
		return service;
	}
	
	
	// 중복아이디 체크
	@Override
	public String memberCheck(String mem_id) {
		
		String id = null;
		
		try {
			id = dao.memberCheck(mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}
	
	// 게스트 회원가입
	@Override
	public String guestInsert(MemberVO vo) {
		
		String id = null;
		
		try {
			id = dao.guestInsert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}
	
	// 호스트 회원가입
	@Override
	public String hostInsert(MemberVO vo) {
		
		String id = null;
		
		try {
			id = dao.hostInsert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}
	
	// 로그인
	@Override
	public int loginCheck(MemberVO vo) {
		
		int cnt = 0;
		
		try {
			cnt = dao.loginCheck(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	// 세션 저장을 위한 게스트 호스트 구분
	@Override
	public HostVO memberDivision(String mem_id) {
		
		HostVO vo = null;
		
		try {
			vo = (HostVO)dao.memberDivision(mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	// 아이디 찾기
	@Override
	public String idFind(MemberVO vo) {
		
		String mem_id = null;
		
		try {
			mem_id = dao.idFind(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mem_id;
	}
	
	// PW찾기 (정보확인)
	@Override
	public MemberVO pwFind(MemberVO vo) {
	
		MemberVO mvo = null;
		
		try {
			mvo = (MemberVO)dao.pwFind(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return mvo;
	}
	
	// 임시 비밀번호 발급
	@Override
	public int tampPassword(MemberVO vo) {
		
		int cnt = 0;
		
		try {
			cnt = dao.tampPassword(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public String insertCart(String mem_id){
		
		String a ="";
		
		try {
			a = dao.insertCart(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return a;
	}

	@Override
	public int selectMember(String mem_id){
		
		int cnt = 0;
		
		
		try {
			cnt = dao.selectMember(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int checkHost(String mem_id) {
		
		int cnt = 0;
		
		
		try {
			cnt = dao.checkHost(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return cnt;
	}

	@Override
	public MemberVO selectMemberList(String mem_id) {
		
		MemberVO vo = null;
		
		try {
			vo = dao.selectMemberList(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return vo;
	}

	@Override
	public int updateMember(MemberVO vo) {
	
		
		int cnt = 0;
		
		try {
			cnt = dao.updateMember(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return cnt;
	}

	
}
