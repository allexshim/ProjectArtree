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
	
	// *********************** 회원가입/로그인 *********************** //
	// ========= 회원가입 insert =========
	@Override
	public int joinInsert(MemberVO mvo) {
		int n = dao.joinInsert(mvo);
		return n;
	} 
	
	// ========= 사용중인 이메일 체크 =========
	@Override
	public boolean duplicateCheck(String email) {
		
		boolean isExistEmail = false;
		
		String result = dao.duplicateCheck(email);
		
		if(result != null) {
			isExistEmail = true;
		}
		
		return isExistEmail;
	}
	
	// ========= 로그인 처리 =========
	@Override
	public MemberVO getLoginMember(HashMap<String, String> paraMap) {
		MemberVO loginuser = dao.getLoginMember(paraMap);
		return loginuser;
	}

	// ========= 회원가입 완료, 선호작품설정 =========
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public List<HashMap<String, String>> joinFinalInsert(HashMap<String, String> paraMap) {

		// member 테이블에 성별, 연령대, 지역 확정 insert
		int n = dao.infoUpdate(paraMap);
		System.out.println("member 테이블에 성별, 연령대, 지역 확정 insert : " +n);
		
		// 받아온 exhibitionno, galleryno로 작품 태그, 장르 select
		List<HashMap<String, String>> favorList = dao.myFavorTagGenre(paraMap);
		System.out.println("받아온 exhibitionno, galleryno로 작품 태그, 장르 select : " +favorList);

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
			System.out.println("wishList 테이블에 선호작품 insert : " +m);

			if(n+m == 3) {
				System.out.println("성공~!");
			}
		}
		
		// 작품 이름, 작가, 작품이미지 select
		List<HashMap<String, String>> myFavorList = dao.myFavorDesc(paraMap);
		System.out.println("작품 이름, 작가, 작품이미지 select : "+myFavorList);
		
		return myFavorList;
	} 

	// ========= 이메일 찾기 =========
	@Override
	public String idFind(HashMap<String, String> paraMap) {
		String email = dao.idFind(paraMap);
		return email;
	} 

	// ========= 비밀번호 찾기 - 입력한 name, email, hp에 맞는 사용자가 있는지 확인 =========
	@Override
	public String findUser(HashMap<String, String> paraMap) {
		String isExist = dao.findUser(paraMap);
		return isExist; 
	}

	// ========= 임시 비밀번호로 현재 비밀번호 변경 =========
	@Override
	public int updatePwd(HashMap<String, String> updateMap) {
		int n = dao.updatePwd(updateMap);
		return n;
	}


	// *********************** 마이페이지 *********************** //
	// ========= chart 개인 선호 장르 select =========
	@Override
	public List<String> myfavorGenre(String idx) {
		List<String> myfavorGenre = dao.myfavorGenre(idx);
		return myfavorGenre;
	}
	// ========= 선호 장르 차트 data =========
	@Override
	public List<HashMap<String, String>> myGenreData(String genre) {
		List<HashMap<String, String>> genreData = dao.myGenreData(genre);
		return genreData;
	}


	
	// ========= word cloud 개인 선호 태그 select =========
	@Override
	public List<String> myfavorTag(String idx) {
		List<String> myfavorTag = dao.myfavorTag(idx);
		return myfavorTag;
	}
	
	// ========= 하트 눌렀을 때 가고싶어요 select =========
	@Override
	public List<HashMap<String, String>> selectWannaGo(String idx) {
		List<HashMap<String, String>> wantList = dao.selectWannaGo(idx);
		return wantList;
	}

	// ========= 책갈피 눌렀을 때 다녀왔어요 select =========
	@Override
	public List<HashMap<String, String>> selectGo(String idx) {
		List<HashMap<String, String>> goList = dao.selectGo(idx);
		return goList;
	}

	// ========= 하트 눌렀을 때 전시회의 작가 select =========
	@Override
	public List<HashMap<String, String>> selectFavorAuthor(String idx) {
		List<HashMap<String, String>> favorAuthor = dao.selectFavorAuthor(idx);
		return favorAuthor;
	}

	// ========= 선호 전시관 =========
	@Override
	public List<HashMap<String, String>> selectfavorGal(String idx) {
		List<HashMap<String, String>> favorGal = dao.selectfavorGal(idx);
		return favorGal;
	}

	// ========= 마이페이지 - 작품 재설정 =========
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int updateFavor(HashMap<String, String> paraMap) {
		int n = dao.updateFavor1(paraMap);
		int m = dao.updateFavor2(paraMap);
		return n+m;
	}

	// ========= 닉네임 변경 =========
	@Override
	public int changeName(HashMap<String, String> paraMap) {
		int n = dao.changeName(paraMap);
		return n;
	}

	// ========= 비밀번호 변경 =========
	@Override
	public int changePwd(HashMap<String, String> paraMap) {
		int n = dao.changePwd(paraMap);
		return n;
	}

	// ========= 회원탈퇴 =========
	@Override
	public int withdrawal(HashMap<String, String> paraMap) {

		// 탈퇴 사유 member insert
		int n = dao.updateWithdrawal(paraMap);
		
		// status 0 으로 변경
		int m = dao.updateStatus(paraMap.get("idx"));
		
		return n+m;
	}

	// ************** 관리자 페이지 **************
	// ========= 지역별 선호 장르 =========

	// 지역마다 선호한 장르 다 가져온다.
	@Override
	public List<String> getAreaFavorGenre(String area) {
		List<String> areaFavorGenre = dao.getAreaFavorGenre(area);
		return areaFavorGenre;
	}

	// 선호 장르 가져가서 카운트
	@Override
	public List<HashMap<String, String>> getGenreCnt(String genre) {
		List<HashMap<String, String>> genreCnt = dao.getGenreCnt(genre);
		return genreCnt;
	}

	// 지역별 선호장르 카운트 총 합
	@Override
	public int getTotalCnt(String genre) {
		int totalCnt = dao.getTotalCnt(genre);
		return totalCnt;
	}



}
