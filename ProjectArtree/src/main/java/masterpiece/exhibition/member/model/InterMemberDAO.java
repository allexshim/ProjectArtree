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

	String idFind(HashMap<String, String> paraMap); // 이메일 찾기

	String findUser(HashMap<String, String> paraMap); // 비밀번호 찾기 - 입력한 name, email, hp에 맞는 사용자가 있는지 확인

	int updatePwd(HashMap<String, String> updateMap); // 임시 비밀번호로 현재 비밀번호 변경

	// 선호 장르 chart
	List<String> myfavorGenre(String idx); // chart 개인 선호 장르 select
	List<HashMap<String, String>> myGenreData(String genre); // 선호 장르 차트 data
	
	List<String> myfavorTag(String idx); // word cloud 개인 선호 태그 select
	
	List<HashMap<String, String>> selectWannaGo(String idx); // 하트 눌렀을 때 가고싶어요 select

	List<HashMap<String, String>> selectGo(String idx); // 책갈피 눌렀을 때 다녀왔어요 select

	List<HashMap<String, String>> selectFavorAuthor(String idx); // 하트 눌렀을 때 전시회의 작가 select
	
	List<HashMap<String, String>> selectfavorGal(String idx); // 선호 전시관
	
	int updateFavor1(HashMap<String, String> paraMap); // 마이페이지 - 작품 재설정1
	int updateFavor2(HashMap<String, String> paraMap); // 마이페이지 - 작품 재설정2

	int changeName(HashMap<String, String> paraMap); // 닉네임 변경 

	int changePwd(HashMap<String, String> paraMap); // 비밀번호 변경

	int updateWithdrawal(HashMap<String, String> paraMap); // 탈퇴 사유 입력
	int updateStatus(String idx); // status 0 으로 변경

	

	








	

}
