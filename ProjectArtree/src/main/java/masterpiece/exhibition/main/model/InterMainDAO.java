package masterpiece.exhibition.main.model;

import java.util.HashMap;
import java.util.List;

public interface InterMainDAO {
	
	// ajax로 호출, 인기 전시회 top3를 가지고 옵니다.
	List<HashMap<String, String>> getMostPolular();

	// ajax로 호출, 신규 전시회 top3를 가지고 옵니다.
	List<HashMap<String, String>> getNewest();

	// ajax ~ 종료임박 전시회 종료일 빠른순으로 3개 가져오기
	List<HashMap<String, String>> getEndSoon();

	// 해당 회원의 선호 태그를 알아온다.
	String getPreferTag(String idx);

	// 가져온 선호 태그를 split으로 자른 후, 가장 선호하는 태그 1개를 가져온다.
	String getFavorTag(String preferTag);

	// 가장 선호하는 태그와 일치하는 전시회 중, 조회수가 높은 순으로 3개 가져온다.
	List<HashMap<String, String>> getFavorExhibition(String favorTag);

	// ajax로 호출, 이벤트 등록 빠른순으로 3개 가져오기
	List<HashMap<String, String>> getNewEvent();

}
