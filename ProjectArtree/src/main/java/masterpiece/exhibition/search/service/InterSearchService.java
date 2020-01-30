package masterpiece.exhibition.search.service;

import java.util.HashMap;
import java.util.List;

public interface InterSearchService {

	// 모든 전시회 정보를 받아온다.
	List<HashMap<String,String>> getAllExhibition();

	// 해당 월의 전시회 정보를 받아온다.
	List<HashMap<String, String>> getExhibitionbyMonth(String month);

	// 해당 날짜의 전시회 정보를 받아온다.
	List<HashMap<String, String>> getExhibitionbyDate(String date);

	// 오늘을 포함해서 전시중인 전시회 정보를 받아온다.
	List<HashMap<String, String>> getExhibitionbyTheme();

	// 선택한 태그에 해당하는 전시회 정보를 받아온다.
	List<HashMap<String, String>> getExhibitionbySelectTheme(String tag);

	// ajax로 호출, 선택한 갤러리에서 열리는 전시회를 가지고 옵니다.
	List<HashMap<String, String>> getExhibitionByLocation(String galleryName);

	////////////////////////////////////////////////////////////////////////////
	
	// 관리자 차트	
	// 각각 tag이름, tag의 빈도수를 저장하는 HashMap
	List<HashMap<String, String>> getChartDataByTags();

}
