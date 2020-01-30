package masterpiece.exhibition.search.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.search.model.InterSearchDAO;

@Service
public class SearchService implements InterSearchService {
	
	@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
	private InterSearchDAO dao;

	// 첫화면, 모든 전시회를 받아온다.
	@Override
	public List<HashMap<String,String>> getAllExhibition() {
		List<HashMap<String,String>> ExhibitionList = dao.getAllExhibition();
		return ExhibitionList;
	}

	// 해당 월의 전시회 정보를 받아온다.
	@Override
	public List<HashMap<String, String>> getExhibitionbyMonth(String month) {
		List<HashMap<String,String>> ExhibitionList = dao.getExhibitionbyMonth(month);
		return ExhibitionList;
	}
	
	// 해당 날짜의 전시회 정보를 받아온다.
	@Override
	public List<HashMap<String, String>> getExhibitionbyDate(String date) {
		List<HashMap<String,String>> ExhibitionList = dao.getExhibitionbyDate(date);
		return ExhibitionList;
	}

	// 오늘을 포함해서 전시중인 전시회 정보를 받아온다.
	@Override
	public List<HashMap<String, String>> getExhibitionbyTheme() {
		List<HashMap<String,String>> ExhibitionList = dao.getExhibitionbyTheme();
		return ExhibitionList;
	}

	// 선택한 태그에 해당하는 전시회 정보를 받아온다.
	@Override
	public List<HashMap<String, String>> getExhibitionbySelectTheme(String tag) {
		List<HashMap<String,String>> ExhibitionList = dao.getExhibitionbySelectTheme(tag);
		return ExhibitionList;
	}
	
	// ajax로 호출, 선택한 갤러리에서 열리는 전시회를 가지고 옵니다.
	@Override
	public List<HashMap<String, String>> getExhibitionByLocation(String galleryName) {
		
		// 해당 갤러리 이름에 해당하는 galleryNo를 받아온다.
		String galleryNo = dao.getGalleryNobyName(galleryName);
		// 해당 galleryNo를 fk로 가지는 exhibiton정보를 받아온다.
		List<HashMap<String,String>> ExhibitionList = dao.getExhibitionbyLocation(galleryNo);
		
		return ExhibitionList;
	}

	////////////////////////////////////////////////////////////////////////
	// 각각 tag이름, tag의 빈도수를 저장하는 HashMap
	@Override
	public List<HashMap<String, String>> getChartDataByTags() {
		
		// 1. 먼저 모든 회원이 선호하는 태그를 가져온 후
		String preferTag = dao.getPreferTag();
		
		// 2. 잘라서 각각 태그의 빈도수를 얻어온다.
		// tag, CNT
	    List<HashMap<String,String>> TagList = dao.getChartDataByTags(preferTag);
		return TagList;

	}
	
	
	
	
	
	
}
