package masterpiece.exhibition.board.review.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO implements InterReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 리뷰 테이블에 있는 모든 글 목록 가져오기
	@Override
	public List<HashMap<String, String>> selectRevList() {
		List<HashMap<String, String>> revList = sqlsession.selectList("review.selectRevList");
		return revList;
	}
	  
	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
	@Override
	public List<HashMap<String, String>> getExhibit(String searchWord) {
		List<HashMap<String, String>> exhibitionList = sqlsession.selectList("review.getExhibit", searchWord);
		return exhibitionList;
	}

	// 새 글 입력
	@Override
	public int addReview(HashMap<String, String> paraMap) {
		int n = sqlsession.insert("review.addReview", paraMap);
		return n;
	}

	// =================== 페이지 바 ===================
	// 검색조건이 없을 경우의 총 게시물 건수(totalCount)
	@Override
	public int getTotalCountWithNoSearch() {
		int n = sqlsession.selectOne("review.getTotalCountWithNoSearch");
		return n;
	}
	// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
	@Override
	public int getTotalCountWithSearch(HashMap<String, String> paraMap) {
		int m = sqlsession.selectOne("review.getTotalCountWithSearch", paraMap);
		return m;
	}

	// 페이징 처리한 글목록 가져오기
	@Override
	public List<ReviewVO> reviewListWithPaging(HashMap<String, String> paraMap) {
		List<ReviewVO> revList = sqlsession.selectList("review.reviewListWithPaging", paraMap);
		return revList;
	}
	// ==============================================
	
	// 보고 온 전시회의 메인 포스터 가져오기
	@Override
	public String getPoster(String revno) {
		String poster = sqlsession.selectOne("review.getPoster", revno);
		return poster;
	}

	// 글 1개 조회
	@Override
	public ReviewVO getView(String revno) {
		ReviewVO revo = sqlsession.selectOne("review.getView", revno);
		return revo;
	}
	// 조회수 증가
	@Override
	public void setAddReadCount(String revno) {
		sqlsession.update("review.setAddReadCount", revno);
	}

	// 작성자만 글 수정 가능
	@Override
	public int modifyEndReview(HashMap<String,String> modifyRev) {
		int n = sqlsession.update("review.modifyEndReview", modifyRev);
		return n;
	}
	
	// 글 삭제
	@Override
	public int delReview(String revno) {
		int n = sqlsession.delete("review.delReview", revno);
		return n;
	}
	// 해당되는 글의 모든 댓글 삭제
	@Override
	public int delAllComment(String revno) {
		int result = sqlsession.delete("review.delAllComment", revno);
		return result;
	}


	// =================== 댓글 ===================
	// 해당 글 번호에 해당하는 댓글 가져오기
	@Override
	public List<HashMap<String, String>> getCommentList(String revno) {
		List<HashMap<String, String>> commentList = sqlsession.selectList("review.getCommentList", revno);
		return commentList;
	}

	// 댓글쓰기
	@Override
	public int addComment(HashMap<String, String> paraMap) {
		int n = sqlsession.insert("review.addComment", paraMap);
		return n;
	}
	// review 테이블에 commentCount 컬럼의 값을 1증가 (update)
	@Override
	public int updateCommentCount(String fk_revno) {
		int result = sqlsession.update("review.updateCommentCount", fk_revno);
		return result;
	}

	// 댓글 수정
	@Override
	public int modifyComment(HashMap<String, String> paraMap) {
		int n = sqlsession.update("review.modifyComment", paraMap);
		return n;
	}
	
	// 댓글 삭제
	@Override
	public int delComment(String commentno) {
		int n = sqlsession.delete("review.delComment", commentno);
		return n;
	}
	// commentCount 1 감소
	@Override
	public int delCommentCount(String fk_revno) {
		int result = sqlsession.update("review.delCommentCount", fk_revno);
		return result;
	}







	
	
	
}
