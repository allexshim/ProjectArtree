package masterpiece.exhibition.board.review.model;

import java.util.HashMap;
import java.util.List;

public interface InterReviewDAO {

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
	// ===============================================
	
	// 보고 온 전시회의 메인 포스터 가져오기
	String getPoster(String revno);
	
	// 글 1개 조회
	ReviewVO getView(String revno);
	// 글 조회수 1 증가
	void setAddReadCount(String revno);

	// 작성자만 글 수정 가능
	int modifyEndReview(HashMap<String,String> modifyRev);

	// 글 삭제
	int delReview(String revno);
	// 해당되는 글의 모든 댓글 삭제
	int delAllComment(String revno);

	// =================== 댓글 ===================
	// 해당 글 번호에 해당하는 댓글 가져오기
	List<HashMap<String, String>> getCommentList(String revno);
	
	// 댓글쓰기
	int addComment(HashMap<String, String> paraMap);
	// review 테이블에 commentCount 컬럼의 값을 1증가 (update)
	int updateCommentCount(String fk_revno);

	// 댓글 수정
	int modifyComment(HashMap<String, String> paraMap);
	
	// 댓글 삭제 
	int delComment(String commentno);
	// commentCount 1 감소
	int delCommentCount(String fk_revno);
}
