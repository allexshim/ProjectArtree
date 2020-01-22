package masterpiece.exhibition.member.model;

import java.util.HashMap;
import java.util.List;

public interface InterMemberDAO {

	int joinInsert(MemberVO mvo); // 회원가입 insert

	MemberVO getLoginMember(HashMap<String, String> paraMap); // 로그인 처리
	
	int infoUpdate(HashMap<String, String> paraMap); // member 테이블에 성별, 연령대, 지역 확정 update

	List<HashMap<String, String>> myFavorTagGenre(HashMap<String, String> paraMap); // 받아온 exhibitionno, galleryno로 작품 태그, 장르 select

	int favorInsert(HashMap<String, String> favorMap); // wishList 테이블에 선호작품 insert

	List<HashMap<String, String>> myFavorDesc(HashMap<String, String> paraMap); // 작품 이름, 작가, 작품이미지 select

	String duplicateCheck(String email); // 사용중인 이메일 체크

	

}
