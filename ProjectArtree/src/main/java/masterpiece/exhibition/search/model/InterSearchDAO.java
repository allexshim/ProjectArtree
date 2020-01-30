package masterpiece.exhibition.search.model;

import java.util.HashMap;
import java.util.List;

public interface InterSearchDAO {
	
	// 첫화면, 모든 전시회를 받아온다.
	List<HashMap<String,String>> getAllExhibition();

	// 해당 월의 전시회 정보를 받아온다.
	List<HashMap<String, String>> getExhibitionbyMonth(String month);

	// 해당 날짜의 전시회 정보를 받아온다.
	List<HashMap<String, String>> getExhibitionbyDate(String date);

	// 오늘을 포함해서 전시중인 전시회 정보를 받아온다.
	List<HashMap<String, String>> getExhibitionbyTheme();

	// 선택한 태그에 해당하는 전시회 정보를 받아온다.
	List<HashMap<String, String>> getExhibitionbySelectTheme(String tag);

	// 해당 갤러리 이름에 해당하는 galleryNo를 받아온다.
	String getGalleryNobyName(String galleryName);

	// 해당 galleryNo를 fk로 가지는 exhibiton정보를 받아온다.
	List<HashMap<String, String>> getExhibitionbyLocation(String galleryNo);

	///////////////////////////////////////////////////////////////////////////
	// 관리자 차트
	// 1. 먼저 모든 회원이 선호하는 태그를 가져온 후
	String getPreferTag();

	// 2. 잘라서 각각 태그의 빈도수를 얻어온다.
	List<HashMap<String, String>> getChartDataByTags(String preferTag);

}
