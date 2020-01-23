package masterpiece.exhibition.main.service;

import java.util.HashMap;
import java.util.List;

public interface InterMainService {
	
	// ajax로 호출, 인기 전시회 top3를 가지고 옵니다.
	List<HashMap<String, String>> getMostPolular();

	// ajax로 호출, 신규 전시회 top3를 가지고 옵니다.
	List<HashMap<String, String>> getNewest();

	// ajax ~ 종료임박 전시회 종료일 빠른순으로 3개 가져오기
	List<HashMap<String, String>> getEndSoon();
	
	// ajax ~ 사용자가 선호하는 태그가 들어간 전시회를 조회수 높은 순으로 3개 가져오기
	List<HashMap<String, String>> getPreference(String idx);

}
