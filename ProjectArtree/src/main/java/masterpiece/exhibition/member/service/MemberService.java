package masterpiece.exhibition.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import masterpiece.exhibition.member.model.InterMemberDAO;
import masterpiece.exhibition.member.model.MemberVO;

@Service 
public class MemberService implements InterMemberService {

	@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
	private InterMemberDAO dao;
	
	// 회원가입 insert
	@Override
	public int joinInsert(MemberVO mvo) {
		int n = dao.joinInsert(mvo);
		return n;
	}
	
	// 로그인 처리
	@Override
	public MemberVO getLoginMember(MemberVO mvo) {
		MemberVO loginuser = dao.getLoginMember(mvo);
		return loginuser;
	}

	// 회원가입 완료, 선호작품설정
	@Override
	
	public List<HashMap<String, String>> joinFinalInsert(HashMap<String, String> paraMap) {

		// member 테이블에 성별, 연령대, 지역 확정 insert
		int n = dao.infoUpdate(paraMap);
		
		// 받아온 exhibitionno, galleryno로 작품 태그, 장르 select
		List<HashMap<String, String>> favorList = dao.myFavorTagGenre(paraMap);

		if(favorList != null) {
			
			HashMap<String, String> favorMap = new HashMap<String, String>();
			favorMap.put("idx", paraMap.get("idx"));
			favorMap.put("exhibitionno1", paraMap.get("exhibitionno1"));
			favorMap.put("galleryno1", paraMap.get("galleryno1"));
			favorMap.put("exhibitionno2", paraMap.get("exhibitionno2"));
			favorMap.put("galleryno2", paraMap.get("galleryno2"));
			
			for(int i=0; i<favorList.size(); i++) {
				favorMap.put("favorTag"+(i+1), favorList.get(i).get("tag"));
				favorMap.put("favorGenre"+(i+1), favorList.get(i).get("genre"));
			}
			
			
			// wishList 테이블에 선호작품 insert
			int m = dao.favorInsert(favorMap);

			if((n+m) == 3) {
				System.out.println("insert 성공!");
			}
		}
		
		// 작품 이름, 작가, 작품이미지 select
		List<HashMap<String, String>> myFavorList = dao.myFavorDesc(paraMap);
		
		return myFavorList;
	}

}
