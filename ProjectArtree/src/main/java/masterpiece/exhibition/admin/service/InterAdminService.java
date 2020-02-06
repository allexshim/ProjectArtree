package masterpiece.exhibition.admin.service;

import java.util.HashMap;
import java.util.List;

import masterpiece.exhibition.admin.model.GalleryVO;
import masterpiece.exhibition.exhibits.model.ExhibitsVO;
import masterpiece.exhibition.member.model.MemberVO;

public interface InterAdminService {

	// ------------------------ 트랜잭션 처리 ------------------------ //
	
	// 전시회등록
	int applyExhibition(HashMap<String, String> newExhibitMap);
	
	// 전시회 이미지 등록
	int addExhibitImage(HashMap<String, String> hashMap);

	// ----------------------------------------------------------- //
	
	// tag 가져오기
	HashMap<String, List<String>> getTags();

	// gallery 가져오기
	List<GalleryVO> getGalleries();

	// gallery location 가져오기
	List<String> getGalleryLocations();

	// gallery 검색
	List<GalleryVO> wordSearchShow(HashMap<String, String> paraMap);

	// 새로 등록할 전시회번호 채번해오기 
	int getApplyingno();

	// 전시회목록 가져오기
	List<ExhibitsVO> getExhibitionList();

	// 전시회정보 가져오기
	HashMap<String, String> getExhibitionDetail(String no);

	// 새로운 전시회목록 가져오기
	List<ExhibitsVO> getNewExhibitionList();

	// 전시 대기 -> 전시중으로 바꾸기
	int changeExhibitStatus(String exhibitionno);

	// 종료된 전시목록 조회
	List<ExhibitsVO> getAfterExhibitionList();

	// 검토할 전시회 목록 조회
	List<HashMap<String, String>> getAppliedExhibitionList();

	// 검토할 전시회 조회
	HashMap<String, String> getAppliedExhibitionDetail(String no);

	// 이미지 가져오기
	List<HashMap<String, String>> getAppliedExhibitionImage(String no);

	//  등록할 전시회번호 채번해오기
	String getExhibitionno();

	// 검토목록에 있던 전시회를 전시예정으로 변경
	int displayNewExhibition(HashMap<String, String> newExhibitMap);

	// 전시회의 이미지 테이블에 insert
	int displayNewExhibitionImg(HashMap<String, String> newExhibitImgMap);

	// 지원된 전시회 테이블(appliedExhibits) 의 status 데이터를 '검토완료'로 변경
	int changeAppliedExhibitsStatus(String no);

	// 회원목록 불러오기
	List<MemberVO> getMemberList();

	// 검색조건이 없을 경우의 총 게시물 건수(totalCount)
	int getTotalCountWithoutSearch();

	// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
	int getTotalCountWithSearch(HashMap<String, String> paraMap);

	// 페이징바 있는 회원목록
	List<MemberVO> memberListWithPaging(HashMap<String, String> paraMap);

	// 탈퇴한 회원목록
	List<MemberVO> deactivatedMemberList(HashMap<String, String> paraMap);

	// 가입회원목록
	List<MemberVO> activatedMemberList(HashMap<String, String> paraMap);

	// 관리자목록
	List<MemberVO> adminList(HashMap<String, String> paraMap);

	// 검색조건이 없을시 탈퇴한 회원목록의 총 게시물건수
	int getTotalCountWithoutSearchDeactivated();
	
	// 검색조건이 있을시 탈퇴한 회원목록의 총 게시물건수
	int getTotalCountWithSearchDeactivated(HashMap<String, String> paraMap);

	// 검색조건이 없을시 가입회원목록의 총 게시물건수
	int getTotalCountWithoutSearchActivated();

	// 검색조건이 있을시 가입회원목록의 총 게시물건수
	int getTotalCountWithSearchActivated(HashMap<String, String> paraMap);

	// 검색조건이 없을시 관리자목록의 총 게시물건수
	int getTotalCountWithoutSearchAdmin();

	// 검색조건이 있을시 관리자목록의 총 게시물건수
	int getTotalCountWithSearchAdmin(HashMap<String, String> paraMap);

	// 회원상세정보출력
	MemberVO getMemberInfo(String no) throws NoSuchMethodException;

	// 주문목록출력
	List<HashMap<String, String>> getOrderList(String no);

	// 주문정보출력
	List<HashMap<String, String>> getOrderInfo(String reserno);

	// 예매율차트
	List<HashMap<String, String>> getChartByTicketingRate(int totalCount);

	// 총 예매 수
	int getTotalCount();



}
