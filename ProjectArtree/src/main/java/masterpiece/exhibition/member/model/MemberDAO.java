package masterpiece.exhibition.member.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements InterMemberDAO {

	@Autowired  
	private SqlSessionTemplate sqlsession;

	// 회원가입 insert
	@Override
	public int joinInsert(MemberVO mvo) {
		int n = sqlsession.insert("member.joinInsert", mvo);
		return n;
	}
	
	// 사용중인 이메일 체크
	@Override
	public String duplicateCheck(String email) {
		String result = sqlsession.selectOne("member.duplicateCheck", email);
		return result;
	}
	
	// 로그인 처리
	@Override
	public MemberVO getLoginMember(HashMap<String, String> paraMap) {
		MemberVO loginuser = sqlsession.selectOne("member.getLoginMember", paraMap);
		return loginuser;
	}

	// ==================== 회원가입 완료 후 작품설정 시작 ==================== //
	// member 테이블에 성별, 연령대, 지역 확정 update
	@Override
	public int infoUpdate(HashMap<String, String> paraMap) {
		
		int n = sqlsession.update("member.infoUpdate", paraMap);
		return n;
	}
	
	// 받아온 exhibitionno, galleryno로 작품 태그, 장르 select
	@Override
	public List<HashMap<String, String>> myFavorTagGenre(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> favorList = sqlsession.selectList("member.myFavorTagGenre", paraMap);
		return favorList;
	}
	
	// wishList 테이블에 선호작품 insert
	@Override
	public int favorInsert(HashMap<String, String> favorMap) {
		int m = sqlsession.insert("member.favorInsert", favorMap);
		return m;
	}

	// 작품 이름, 작가, 작품이미지 select
	@Override
	public List<HashMap<String, String>> myFavorDesc(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> myFavorList = sqlsession.selectList("member.myFavorDesc", paraMap);
		return myFavorList;
	}
	// ==================== 회원가입 완료 후 작품설정 끝 ==================== //



	
	
}
