package dog.service;

import javax.servlet.http.HttpSession;

import dog.model.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO vo) throws Exception;
	public void logout(HttpSession session) throws Exception;
	
}
