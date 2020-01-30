package masterpiece.exhibition.admin.service;

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
		
		
	//	System.out.println("========================== " + alltags.get("색상별"));
			
		
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


	
}
