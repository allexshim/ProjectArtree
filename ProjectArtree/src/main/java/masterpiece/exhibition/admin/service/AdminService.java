package masterpiece.exhibition.admin.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.common.AES256;
import masterpiece.exhibition.exhibits.model.ExhibitsVO;
import masterpiece.exhibition.member.model.MemberVO;
import masterpiece.exhibition.admin.model.AppliedExhibitionVO;
import masterpiece.exhibition.admin.model.GalleryVO;
import masterpiece.exhibition.admin.model.InterAdminDAO;

@Service
public class AdminService implements InterAdminService {

	// 의존객체 주입 ( DI: Dependency Injection )
	@Autowired
	private InterAdminDAO dao;
	
	@Autowired 
	private AES256 aes;
	
	// 전시회등록
	@Override
	public int applyExhibition(HashMap<String, String> newExhibitMap) {
		int n = dao.applyExhibition(newExhibitMap);
		return n;
	}
	
	// 전시회 이미지 등록
	@Override
	public int addExhibitImage(HashMap<String, String> hashMap) {
		int n = dao.addExhibitImage(hashMap);
		return n;
	}

	// tag 가져오기
	@Override
	public HashMap<String, List<String>> getTags() {

		HashMap<String, List<String>> alltags = dao.getAllTags();
		
		return alltags;
	}

	// gallery 가져오기
	@Override
	public List<GalleryVO> getGalleries() {
		List<GalleryVO> allGalleries = dao.getGalleries();
		return allGalleries;
	}

	// gallery location 가져오기
	@Override
	public List<String> getGalleryLocations() {
		List<String> galleryLocations = dao.getGalleryLocations();
		return galleryLocations;
	}

	// gallery 검색
	@Override
	public List<GalleryVO> wordSearchShow(HashMap<String, String> paraMap) {
		List<GalleryVO> result = dao.wordSearchShow(paraMap);
		return result;
	}

	// 새로 등록할 전시회번호 채번해오기 
	@Override
	public int getApplyingno() {
		int applyingno = dao.getApplyingno();
		
		return applyingno;
	}

	// 전시회목록 가져오기
	@Override
	public List<ExhibitsVO> getExhibitionList() {
		List<ExhibitsVO> exhibitionList = dao.getExhibitionList();
		return exhibitionList;
	}

	// 전시회정보 가져오기
	@Override
	public HashMap<String, String> getExhibitionDetail(String no) {
		HashMap<String, String> exhibitionInfo = dao.getExhibitionDetail(no);
		return exhibitionInfo;
	}

	// 새로운 전시회목록 가져오기
	@Override
	public List<ExhibitsVO> getNewExhibitionList() {
		List<ExhibitsVO> exhibitionList = dao.getNewExhibitionList();
		return exhibitionList;
	}

	// 전시 대기 -> 전시중으로 바꾸기
	@Override
	public int changeExhibitStatus(String exhibitionno) {
		int n = dao.changeExhibitStatus(exhibitionno);
		return n;
	}

	// 종료된 전시목록 조회
	@Override
	public List<ExhibitsVO> getAfterExhibitionList() {
		List<ExhibitsVO> exhibitionList = dao.getAfterExhibitionList();
		return exhibitionList;
	}

	// 검토할 전시회 목록 조회
	@Override
	public List<HashMap<String, String>> getAppliedExhibitionList() {
		List<HashMap<String, String>> exhibitionList = dao.getAppliedExhibitionList();
		return exhibitionList;
	}

	// 검토할 전시회 조회
	@Override
	public HashMap<String, String> getAppliedExhibitionDetail(String no) {
		HashMap<String, String> exhibitionInfo = dao.getAppliedExhibitionDetail(no);
		return exhibitionInfo;
	}

	// 이미지 가져오기
	@Override
	public List<HashMap<String, String>> getAppliedExhibitionImage(String no) {
		List<HashMap<String, String>> imgList = dao.getAppliedExhibitionImage(no);
		return imgList;
	}

	// 등록할 전시회번호 채번해오기
	@Override
	public String getExhibitionno() {
		String exhibitionno = dao.getExhibitionno();
		return exhibitionno;
	}

	// 검토목록에 있던 전시회를 전시예정으로 변경
	@Override
	public int displayNewExhibition(HashMap<String, String> newExhibitMap) {
		int n = dao.displayNewExhibition(newExhibitMap);
		return n;
	}

	// 전시회의 이미지 테이블에 insert
	@Override
	public int displayNewExhibitionImg(HashMap<String, String> newExhibitImgMap) {
		int m = dao.displayNewExhibitionImg(newExhibitImgMap);
		return m;
	}

	// 지원된 전시회 테이블(appliedExhibits) 의 status 데이터를 '검토완료'로 변경
	@Override
	public int changeAppliedExhibitsStatus(String no) {
		int l = dao.changeAppliedExhibitsStatus(no);
		return l;
	}

	// 회원목록 불러오기
	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = dao.getMemberList();
		return memberList;
	}

	// 검색조건이 없을 경우의 총 게시물 건수(totalCount)
	@Override
	public int getTotalCountWithoutSearch() {
		int n = dao.getTotalCountWithoutSearch();
		return n;
	}

	// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
	@Override
	public int getTotalCountWithSearch(HashMap<String, String> paraMap) {
		int n = dao.getTotalCountWithSearch(paraMap);
		return n;
	}

	// 페이징바 있는 회원목록
	@Override
	public List<MemberVO> memberListWithPaging(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = dao.memberListWithPaging(paraMap);
		return memberList;
	}

	// 탈퇴한 회원목록
	@Override
	public List<MemberVO> deactivatedMemberList(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = dao.deactivatedMemberList(paraMap);
		return memberList;
	}

	// 가입회원목록
	@Override
	public List<MemberVO> activatedMemberList(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = dao.activatedMemberList(paraMap);
		return memberList;
	}

	// 관리자목록
	@Override
	public List<MemberVO> adminList(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = dao.adminList(paraMap);
		return memberList;
	}

	// 검색조건이 없을시 탈퇴한 회원목록의 총 게시물건수
	@Override
	public int getTotalCountWithoutSearchDeactivated() {
		int n = dao.getTotalCountWithoutSearchDeactivated();
		return n;
	}

	// 검색조건이 있을시 탈퇴한 회원목록의 총 게시물건수
	@Override
	public int getTotalCountWithSearchDeactivated(HashMap<String, String> paraMap) {
		int n = dao.getTotalCountWithSearchDeactivated(paraMap);
		return n;
	}

	// 검색조건이 없을시 가입회원목록의 총 게시물건수
	@Override
	public int getTotalCountWithoutSearchActivated() {
		int n = dao.getTotalCountWithoutSearchActivated();
		return n;
	}

	// 검색조건이 있을시 가입회원목록의 총 게시물건수
	@Override
	public int getTotalCountWithSearchActivated(HashMap<String, String> paraMap) {
		int n = dao.getTotalCountWithSearchActivated(paraMap);
		return n;
	}

	// 검색조건이 없을시 관리자목록의 총 게시물건수
	@Override
	public int getTotalCountWithoutSearchAdmin() {
		int n = dao.getTotalCountWithoutSearchAdmin();
		return n;
	}

	// 검색조건이 있을시 관리자목록의 총 게시물건수
	@Override
	public int getTotalCountWithSearchAdmin(HashMap<String, String> paraMap) {
		int n = dao.getTotalCountWithSearchAdmin(paraMap);
		return n;
	}

	// 회원상세정보출력
	@Override
	public MemberVO getMemberInfo(String no) throws NoSuchMethodException {
		MemberVO member = dao.getMemberInfo(no);
		
		try {
			member.setHp(aes.decrypt(member.getHp()));
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		
		String status = member.getStatus();
		
		if("0".equals(status)) {
			member.setStatus("탈퇴회원");
		} else if("1".equals(status)) {
			member.setStatus("가입회원");
		} else {
			member.setStatus("관리자");
		}
		
		String gender = member.getGender();
		
		if("2".equals(gender)) {
			member.setGender("여자");
		} else {
			member.setGender("남자");
		}
		
		return member;
	}

	// 주문목록출력
	@Override
	public List<HashMap<String, String>> getOrderList(String no) {
		List<HashMap<String, String>> orderList = dao.getOrderList(no);
		
		return orderList;
	}

	// 주문정보출력
	@Override
	public List<HashMap<String, String>> getOrderInfo(String reserno) {
		List<HashMap<String, String>> orderInfo = dao.getOrderInfo(reserno);
		return orderInfo;
	}

	// 예매율차트
	@Override
	public List<HashMap<String, String>> getChartByTicketingRate(int totalCount) {
		List<HashMap<String, String>> exList = dao.getChartByTicketingRate(totalCount);
		return exList;
	}

	// 총 예매 수
	@Override
	public int getTotalCount() {
		int n = dao.getTotalCount();
		return n;
	}
	
	


	
}
