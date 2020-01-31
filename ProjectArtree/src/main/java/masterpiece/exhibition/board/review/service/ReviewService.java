package masterpiece.exhibition.board.review.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import masterpiece.exhibition.board.review.model.InterReviewDAO;
import masterpiece.exhibition.board.review.model.ReviewVO;


@Service
public class ReviewService implements InterReviewService {

	@Autowired
	InterReviewDAO dao;
	
	// 리뷰 테이블에 있는 모든 글 목록 가져오기
	@Override
	public List<HashMap<String, String>> selectRevList() {
		List<HashMap<String, String>> revList = dao.selectRevList();
		return revList; 
	}  
	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
	@Override
	public List<HashMap<String, String>> getExhibit(String searchWord) {
		List<HashMap<String, String>> exhibitionList = dao.getExhibit(searchWord);
		return exhibitionList;
	}

	// 새 글 입력
	@Override
	public int addReview(HashMap<String, String> paraMap) {
		int n = dao.addReview(paraMap);
		return n;
	}
	
	// =================== 페이지 바 ===================
	// 검색조건이 없을 경우의 총 게시물 건수(totalCount)
	@Override
	public int getTotalCountWithNoSearch() {
		int n = dao.getTotalCountWithNoSearch();
		return n;
	}
	// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
	@Override
	public int getTotalCountWithSearch(HashMap<String, String> paraMap) {
		int m = dao.getTotalCountWithSearch(paraMap);
		return m;
	}
	
	// 페이징 처리한 글목록 가져오기
	@Override
	public List<ReviewVO> reviewListWithPaging(HashMap<String, String> paraMap) {
		List<ReviewVO> revList = dao.reviewListWithPaging(paraMap);
		return revList;
	}
	// ===============================================
	
	// 글조회수 증가와 함께 글 1개를 조회를 해주는 것
	@Override
	public ReviewVO getView(String revno, String idx) {
		ReviewVO revo = dao.getView(revno);
	      
        if(idx != null && !idx.equalsIgnoreCase(revo.getFk_idx())) {
        	// 다른 사람의 글을 읽을 때만 조회수 증가
           dao.setAddReadCount(revno);
           revo = dao.getView(revno);
        }
        
        return revo;
	}

	// 조회수 증가하지 않고 글 1개 조회
	@Override
	public ReviewVO getViewWithNoAddCount(String revno) {
		ReviewVO revo = dao.getView(revno);
		return revo;
	}

	// 보고 온 전시회의 메인 포스터 가져오기
	@Override
	public String getPoster(String revno) {
		String poster = dao.getPoster(revno);
		return poster;
	}

	// 작성자만 글 수정 가능
	@Override
	public int modifyEndReview(HashMap<String,String> modifyRev) {
		int n = dao.modifyEndReview(modifyRev);
		return n;
	}
	
	// 글 삭제
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int delReview(String revno) {
		
		int result = 0;
		
		// 글 삭제
		int n = dao.delReview(revno);
		
		if(n==1) {
			// 해당되는 글의 모든 댓글 삭제
			result = dao.delAllComment(revno);
		}
		
		return result+n;
	}


	// =================== 댓글 ===================
	// 해당 글 번호에 해당하는 댓글 가져오기
	@Override
	public List<HashMap<String, String>> getCommentList(String revno) {
		List<HashMap<String, String>> commentList = dao.getCommentList(revno);
		return commentList;
	}

	// 댓글 등록
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int addComment(HashMap<String, String> paraMap) {
		
		int result = 0;
		
		int n = dao.addComment(paraMap); // 댓글쓰기
		
		if(n==1) {
			// review 테이블에 commentCount 컬럼의 값을 1증가 (update)
			String fk_revno = paraMap.get("fk_revno");
			result = dao.updateCommentCount(fk_revno); 
		}
		return result;
	}

	// 댓글 수정
	@Override
	public int modifyComment(HashMap<String, String> paraMap) {
		int n = dao.modifyComment(paraMap);
		return n;
	}
	
	// 댓글 삭제
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int delComment(HashMap<String, String> paraMap) {
		
		int result = 0;
		
		// 댓글 삭제
		int n = dao.delComment(paraMap.get("commentno"));
		
		if(n==1) {
			// commentCount 1 감소
			result = dao.delCommentCount(paraMap.get("fk_revno"));
		}
		
		return result;
	}

	
	
	


	
}
