package masterpiece.exhibition.board.community.service;

import java.util.HashMap;
import java.util.List;

public interface InterCommunityService {

	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
	List<HashMap<String, String>> getExhibit(String searchWord);

	// 새 글 추가하기
	int addCommunity(HashMap<String, String> addCommunity);

}
