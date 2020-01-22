package masterpiece.exhibition.member.service;

import java.util.HashMap;
import java.util.List;

import masterpiece.exhibition.member.model.MemberVO;

public interface InterMemberService {

	int joinInsert(MemberVO mvo); // 회원가입 insert
	
	boolean duplicateCheck(String email); // 사용중인 이메일 체크

	MemberVO getLoginMember(HashMap<String, String> paraMap); // 로그인 처리
	
	List<HashMap<String, String>> joinFinalInsert(HashMap<String, String> paraMap); // 회원가입 완료, 선호작품설정

	String idFind(HashMap<String, String> paraMap); // 이메일 찾기

	String findUser(HashMap<String, String> paraMap); // 비밀번호 찾기 - 입력한 name, email, hp에 맞는 사용자가 있는지 확인

	int updatePwd(HashMap<String, String> updateMap); // 임시 비밀번호로 현재 비밀번호 변경

	

}
