package masterpiece.exhibition.member.service;

import java.util.HashMap;
import java.util.List;

import masterpiece.exhibition.member.model.MemberVO;

public interface InterMemberService {

	int joinInsert(MemberVO mvo); // 회원가입 insert
	
	boolean duplicateCheck(String email); // 사용중인 이메일 체크

	MemberVO getLoginMember(HashMap<String, String> paraMap); // 로그인 처리
	
	List<HashMap<String, String>> joinFinalInsert(HashMap<String, String> paraMap); // 회원가입 완료, 선호작품설정

	

}
