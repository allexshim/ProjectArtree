package masterpiece.exhibition.board.community.service;

import java.util.HashMap;
import java.util.List;

public interface InterCommunityService {

	// 목록 불러오기
	List<HashMap<String, String>> getCommunity(HashMap<String, String> searchMap);
	
	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
	List<HashMap<String, String>> getExhibit(String searchWord);

	// 새 글 추가하기
	int addCommunity(HashMap<String, String> addCommunity);
	
	// 해당 글번호의 글 정보 가져오기
	HashMap<String, String> getCommunityDetail(String no, String idx);

	// 조회수 증가 없이 해당 글번호의 글 정보 가져오기
	HashMap<String, String> getCommunityDetailNoCount(String no);
	
	// 글 수정하기 
	int modifyCommunity(HashMap<String, String> modifycommu);

	// 새 댓글 등록하기
	List<HashMap<String,String>> addComment(HashMap<String, String> comment);
	
	// 해당 글번호에 달린 댓글 가져오기
	List<HashMap<String,String>> getCommunityComment(String no);

	// 수정한 댓글을 update하고 해당 글의 댓글 목록을 가져온다.
	List<HashMap<String, String>> modifyComment(HashMap<String, String> comment);

	// 댓글을 삭제하고 해당 글의 댓글 목록을 다시 가져온다.
	List<HashMap<String, String>> deleteComment(HashMap<String, String> comment);

	// 글 삭제하기 >> 1.해당 글의 댓글 삭제 2.해당 글 삭제
	int deleteCommunity(String no);

	



}
