package masterpiece.exhibition.member.service;

import java.util.HashMap;
import java.util.List;

import masterpiece.exhibition.member.model.MemberVO;

public interface InterMemberService {

	int joinInsert(MemberVO mvo); // 회원가입 insert

	MemberVO getLoginMember(MemberVO mvo); // 로그인 처리
	
	List<HashMap<String, String>> joinFinalInsert(HashMap<String, String> paraMap); // 회원가입 완료, 선호작품설정

	

}
