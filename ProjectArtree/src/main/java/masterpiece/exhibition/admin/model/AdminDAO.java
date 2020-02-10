package masterpiece.exhibition.admin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import masterpiece.exhibition.exhibits.model.ExhibitsVO;
import masterpiece.exhibition.member.model.MemberVO;

@Repository
public class AdminDAO implements InterAdminDAO {

	// 의존객체 주입 ( DI: Dependency Injection )
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 전시회등록
	@Override
	public int applyExhibition(HashMap<String, String> newExhibitMap) {
		int n = sqlsession.insert("admin.applyExhibition", newExhibitMap);
		return n;
	}

	// 전시회 이미지 등록
	@Override
	public int addExhibitImage(HashMap<String, String> hashMap) {
		int n = sqlsession.insert("admin.addExhibitImage", hashMap);
		return n;
	}
	
	// tag 가져오기
	@Override
	public HashMap<String, List<String>> getAllTags() {
		
		HashMap<String, List<String>> alltags = new HashMap<String, List<String>>();
		
		List<String> types = sqlsession.selectList("admin.getTypes");
		
		for(String type : types) {
			
			List<String> keywords = sqlsession.selectList("admin.getKeywords", type);
			alltags.put(type, keywords);
			
		}
		
		return alltags;
	}

	// gallery 가져오기
	@Override
	public List<GalleryVO> getGalleries() {
		List<GalleryVO> galleries = sqlsession.selectList("admin.getGalleries");
		return galleries;
	}

	// gallery location 가져오기
	@Override
	public List<String> getGalleryLocations() {
		List<String> galleryLocations = sqlsession.selectList("admin.getGalleryLocations");
		return galleryLocations;
	}

	// gallery 검색
	@Override
	public List<GalleryVO> wordSearchShow(HashMap<String, String> paraMap) {
		List<GalleryVO> result = sqlsession.selectList("admin.wordSearchShow", paraMap);
		return result;
	}

	// 새로 등록할 전시회번호 채번해오기 
	@Override
	public int getApplyingno() {
		int applyingno = sqlsession.selectOne("admin.getApplyingno");
		return applyingno;
	}

	// 전시회목록 가져오기
	@Override
	public List<ExhibitsVO> getExhibitionList() {
		List<ExhibitsVO> exhibitionList = sqlsession.selectList("admin.getExhibitionList");
		return exhibitionList;
	}

	// 전시회정보 가져오기
	@Override
	public HashMap<String, String> getExhibitionDetail(String no) {
		HashMap<String, String> exhibitionInfo = sqlsession.selectOne("admin.getExhibitionDetail", no);
		return exhibitionInfo;
	}

	// 새로운 전시회목록 가져오기
	@Override
	public List<ExhibitsVO> getNewExhibitionList() {
		List<ExhibitsVO> exhibitionList = sqlsession.selectList("admin.getNewExhibitionList");
		return exhibitionList;
	}

	// 전시 대기 -> 전시중으로 바꾸기
	@Override
	public int changeExhibitStatus(String exhibitionno) {
		int n = sqlsession.update("admin.changeExhibitStatus", exhibitionno);
		return n;
	}

	// 종료된 전시목록 조회
	@Override
	public List<ExhibitsVO> getAfterExhibitionList() {
		List<ExhibitsVO> exhibitionList = sqlsession.selectList("admin.getAfterExhibitionList");
		return exhibitionList;
	}

	// 검토할 전시회 목록 조회
	@Override
	public List<HashMap<String, String>> getAppliedExhibitionList() {
		List<HashMap<String, String>> exhibitionList = sqlsession.selectList("admin.getAppliedExhibitionList");
		return exhibitionList;
	}

	// 검토할 전시회 조회
	@Override
	public HashMap<String, String> getAppliedExhibitionDetail(String no) {
		HashMap<String, String> exhibitionInfo = sqlsession.selectOne("admin.getAppliedExhibitionDetail", no);
		return exhibitionInfo;
	}

	// 이미지 가져오기
	@Override
	public List<HashMap<String, String>> getAppliedExhibitionImage(String no) {
		List<HashMap<String, String>> imgList = sqlsession.selectList("admin.getAppliedExhibitionImage", no);
		return imgList;
	}

	// 등록할 전시회번호 채번해오기
	@Override
	public String getExhibitionno() {
		String exhibitionno = sqlsession.selectOne("admin.getExhibitionno");
		return exhibitionno;
	}

	// 검토목록에 있던 전시회를 전시예정으로 변경
	@Override
	public int displayNewExhibition(HashMap<String, String> newExhibitMap) {
		
		int n = sqlsession.insert("admin.displayNewExhibition", newExhibitMap);
		
		return n;
	}

	// 전시회의 이미지 테이블에 insert
	@Override
	public int displayNewExhibitionImg(HashMap<String, String> newExhibitImgMap) {
		int m = sqlsession.insert("admin.displayNewExhibitionImg", newExhibitImgMap);
		return m;
	}

	// 지원된 전시회 테이블(appliedExhibits) 의 status 데이터를 '검토완료'로 변경
	@Override
	public int changeAppliedExhibitsStatus(String no) {
		int l = sqlsession.update("admin.changeAppliedExhibitsStatus", no);
		return l;
	}

	// 회원목록 불러오기
	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = sqlsession.selectList("admin.getMemberList");
		return memberList;
	}

	// 검색조건이 없을 경우의 총 게시물 건수(totalCount)
	@Override
	public int getTotalCountWithoutSearch() {
		int n = sqlsession.selectOne("admin.getTotalCountWithoutSearch");
		return n;
	}

	// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
	@Override
	public int getTotalCountWithSearch(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("admin.getTotalCountWithSearch", paraMap);
		return n;
	}

	// 페이징바 있는 회원목록
	@Override
	public List<MemberVO> memberListWithPaging(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = sqlsession.selectList("admin.memberListWithPaging", paraMap);
		return memberList;
	}

	// 탈퇴한 회원목록
	@Override
	public List<MemberVO> deactivatedMemberList(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = sqlsession.selectList("admin.deactivatedMemberList", paraMap);
		return memberList;
	}

	// 가입회원목록
	@Override
	public List<MemberVO> activatedMemberList(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = sqlsession.selectList("admin.activatedMemberList", paraMap);
		return memberList;
	}

	// 관리자목록
	@Override
	public List<MemberVO> adminList(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = sqlsession.selectList("admin.adminList", paraMap);
		return memberList;
	}

	// 검색조건이 없을시 탈퇴한 회원목록의 총 게시물건수
	@Override
	public int getTotalCountWithoutSearchDeactivated() {
		int n = sqlsession.selectOne("admin.getTotalCountWithoutSearchDeactivated");
		return n;
	}

	// 검색조건이 있을시 탈퇴한 회원목록의 총 게시물건수
	@Override
	public int getTotalCountWithSearchDeactivated(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("admin.getTotalCountWithSearchDeactivated", paraMap);
		return n;
	}

	// 검색조건이 없을시 가입회원목록의 총 게시물건수
	@Override
	public int getTotalCountWithoutSearchActivated() {
		int n = sqlsession.selectOne("admin.getTotalCountWithoutSearchActivated");
		return n;
	}

	// 검색조건이 있을시 가입회원목록의 총 게시물건수
	@Override
	public int getTotalCountWithSearchActivated(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("admin.getTotalCountWithSearchActivated", paraMap);
		return n;
	}

	// 검색조건이 없을시 관리자목록의 총 게시물건수
	@Override
	public int getTotalCountWithoutSearchAdmin() {
		int n = sqlsession.selectOne("admin.getTotalCountWithoutSearchAdmin");
		return n;
	}
	
	// 검색조건이 있을시 관리자목록의 총 게시물건수
	@Override
	public int getTotalCountWithSearchAdmin(HashMap<String, String> paraMap) {
		int n = sqlsession.selectOne("admin.getTotalCountWithSearchAdmin", paraMap);
		return n;
	}

	// 회원상세정보출력
	@Override
	public MemberVO getMemberInfo(String no) {
		MemberVO member = sqlsession.selectOne("admin.getMemberInfo", no);
		return member;
	}

	// 주문목록출력
	@Override
	public List<HashMap<String, String>> getOrderList(String no) {
		List<HashMap<String, String>> orderList = sqlsession.selectList("admin.getOrderList", no);
		
		return orderList;
	}

	// 주문정보출력
	@Override
	public List<HashMap<String, String>> getOrderInfo(String reserno) {
		List<HashMap<String, String>> orderInfo = sqlsession.selectList("admin.getOrderInfo", reserno);
		
		return orderInfo;
	}

	// 예매율차트
	@Override
	public List<HashMap<String, String>> getChartByTicketingRate(int totalCount) {
		List<HashMap<String, String>> exList = sqlsession.selectList("admin.getChartByTicketingRate", totalCount);
		
		return exList;
	}

	// 총 예매 수
	@Override
	public int getTotalCount() {
		int n = sqlsession.selectOne("admin.getTotalCount");
		return n;
	}


	
}
