package masterpiece.exhibition.board.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import masterpiece.exhibition.board.community.model.InterCommunityDAO;

@Service
public class CommunityService implements InterCommunityService {

	@Autowired
	InterCommunityDAO dao;
	
	// 목록 불러오기
	@Override
	public List<HashMap<String, String>> getCommunity(HashMap<String, String> searchMap) {

		// 해당하는 게시글 불러오기
		List<HashMap<String, String>> communityList = null;
		communityList = dao.getCommunity(searchMap);
		
		// 각각 게시글에 달린 댓글 개수 알아오기
		for(HashMap<String, String> map : communityList) {
			int CmtCount = dao.getNumberOfComment(map.get("no"));
			map.put("CmtCount", String.valueOf(CmtCount));
		}
		return communityList;
	}
	
	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
	@Override
	public List<HashMap<String, String>> getExhibit(String searchWord) {
		List<HashMap<String, String>> exhibitionList = dao.getExhibit(searchWord);
		return exhibitionList;
	}

	// 새 글 추가하기
	@Override
	public int addCommunity(HashMap<String, String> addCommunity) {
		int n = dao.addCommunity(addCommunity);
		return n;
	}

	// 해당 글번호의 글 정보 가져오기
	@Override
	public HashMap<String, String> getCommunityDetail(String no, String idx) {

		HashMap<String, String> communityDetail = dao.getCommunityDetail(no);
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("fk_idx", idx);
		map.put("no", no);
		
		// 조회수 증가시키기
		int n = dao.updateReadCount(map);
		
		return communityDetail;
	}
	
	// 조회수 증가 없이 해당 글번호의 글 정보 가져오기
	@Override
	public HashMap<String, String> getCommunityDetailNoCount(String no) {
		HashMap<String, String> communityDetail = dao.getCommunityDetail(no);
		return communityDetail;
	}

	// 글 수정하기 
	@Override
	public int modifyCommunity(HashMap<String, String> modifycommu) {
		int n = dao.modifyCommunity(modifycommu);
		return n;
	}

	// 새 댓글 등록하기
	@Override
	public List<HashMap<String,String>> addComment(HashMap<String, String> comment) {
		int n = dao.addComment(comment);
		List<HashMap<String,String>> commentList = null;
		if(n==1) {
			commentList = dao.getCommunityComment(comment.get("fk_no"));
		}
		
		return commentList;
	}

	// 해당 글번호에 달린 댓글 가져오기
	@Override
	public List<HashMap<String,String>> getCommunityComment(String no) {
		List<HashMap<String,String>> commentList = new ArrayList<HashMap<String,String>>();
		commentList = dao.getCommunityComment(no);
		return commentList;
	}

	// 수정한 댓글을 update하고 해당 글의 댓글 목록을 가져온다.
	@Override
	public List<HashMap<String, String>> modifyComment(HashMap<String, String> comment) {
		
		// 1. update하기
		int n = dao.modifyComment(comment);
		
		List<HashMap<String,String>> commentList = null;
		if(n==1) {
			// 2. 댓글 목록 가져오기
			commentList = dao.getCommunityComment(comment.get("fk_no"));
		} // 실패한다면 commentList == null;
		
		return commentList;
	}

	// 댓글을 삭제하고 해당 글의 댓글 목록을 다시 가져온다.
	@Override
	public List<HashMap<String, String>> deleteComment(HashMap<String, String> comment) {
		// 1. delete하기 ~ commentNo
		int n = dao.deleteComment(comment.get("commentNo"));
		
		List<HashMap<String,String>> commentList = null;
		if(n==1) {
			// 2. 댓글 목록 가져오기
			commentList = dao.getCommunityComment(comment.get("fk_no"));
		} // 실패한다면 commentList == null;
				
		return commentList;
	}

	// 글 삭제하기 >> 1.해당 글의 댓글 삭제 2.해당 글 삭제
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})  
	public int deleteCommunity(String no) {
		
		// 해당 글의 댓글 삭제
		int n = dao.deleteCommunityComment(no);

		// 해당 글 삭제
		int m = dao.deleteCommunity(no); 

		return n*m;
	}

	
	
	

}
