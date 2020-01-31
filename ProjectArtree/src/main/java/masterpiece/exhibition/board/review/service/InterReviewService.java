package masterpiece.exhibition.board.review.service;

import java.util.HashMap;
import java.util.List;

import masterpiece.exhibition.board.review.model.ReviewVO;

public interface InterReviewService {

	// 리뷰 테이블에 있는 모든 글 목록 가져오기
	List<HashMap<String, String>> selectRevList(); 
	
	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
	List<HashMap<String, String>> getExhibit(String searchWord);

	// 새 글 입력
	int addReview(HashMap<String, String> paraMap);
                       
	// =================== 페이지 바 ===================
	// 검색조건이 없을 경우의 총 게시물 건수(totalCount)
	int getTotalCountWithNoSearch();
	// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
	int getTotalCountWithSearch(HashMap<String, String> paraMap);

	// 페이징 처리한 글목록 가져오기
	List<ReviewVO> reviewListWithPaging(HashMap<String, String> paraMap);
	// ==============================================
	
	// 보고 온 전시회의 메인 포스터 가져오기
	String getPoster(String revno);
	
	// 글조회수 증가와 함께 글 1개를 조회를 해주는 것
	ReviewVO getView(String revno, String idx);

	// 조회수 증가하지 않고 글 1개 조회
	ReviewVO getViewWithNoAddCount(String revno);

	// 작성자만 글 수정 가능
	int modifyEndReview(HashMap<String,String> modifyRev);
	
	// 글 삭제
	int delReview(String revno);


	// =================== 댓글 ===================
	// 해당 글 번호에 해당하는 댓글 가져오기
	List<HashMap<String, String>> getCommentList(String revno);

	// 댓글 등록
	int addComment(HashMap<String, String> paraMap);

	// 댓글 수정
	int modifyComment(HashMap<String, String> paraMap);
	
	// 댓글 삭제
	int delComment(HashMap<String, String> paraMap);
	
	




	
}
