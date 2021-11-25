package dog.domain.member;

import javax.servlet.http.HttpSession;

import dog.domain.member.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO vo) throws Exception;
	public void logout(HttpSession session) throws Exception;
	
}
