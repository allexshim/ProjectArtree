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


}
