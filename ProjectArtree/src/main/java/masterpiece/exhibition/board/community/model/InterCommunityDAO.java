package masterpiece.exhibition.board.community.model;

import java.util.HashMap;
import java.util.List;

public interface InterCommunityDAO {
	
	// 목록 불러오기
	List<HashMap<String, String>> getCommunity(HashMap<String, String> searchMap);

	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
	List<HashMap<String, String>> getExhibit(String searchWord);

	// 새 글 추가하기
	int addCommunity(HashMap<String, String> addCommunity);

	// 해당 글번호의 글 정보 가져오기
	HashMap<String, String> getCommunityDetail(String no);

	// 조회수 증가시키기
	int updateReadCount(HashMap<String, String> map);
	
	// 글 수정하기 
	int modifyCommunity(HashMap<String, String> modifycommu);

	// 새 댓글 등록하기
	int addComment(HashMap<String, String> comment);

	// 해당 글번호에 달린 댓글 가져오기
	List<HashMap<String,String>> getCommunityComment(String no);

	// 수정한 댓글 update하기
	int modifyComment(HashMap<String, String> comment);

	// 댓글 삭제하기
	int deleteComment(String commentNo);

	// 각각 게시글에 달린 댓글 개수 알아오기
	int getNumberOfComment(String no);

	// 해당 글의 댓글 삭제
	int deleteCommunityComment(String no);

	// 해당 글 삭제
	int deleteCommunity(String no);


}
