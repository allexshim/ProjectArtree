package masterpiece.exhibition.search.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAO implements InterSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	// 모든 전시회 정보를 받아온다.
	@Override
	public List<HashMap<String,String>> getAllExhibition() {
		
		List<HashMap<String,String>> ExhibitionList = sqlsession.selectList("search.getAllExhibition");
		
		return ExhibitionList;
	} // end of getAllExhibition ------------------------------------

	
	// 해당 월의 전시회 정보를 받아온다.
	@Override
	public List<HashMap<String, String>> getExhibitionbyMonth(String month) {
		List<HashMap<String,String>> ExhibitionList = sqlsession.selectList("search.getExhibitionbyMonth", month);
		return ExhibitionList;
	} // end of getExhibitionbyMonth ------------------------------------

	// 해당 날짜의 전시회 정보를 받아온다.
	@Override
	public List<HashMap<String, String>> getExhibitionbyDate(String date) {
		List<HashMap<String,String>> ExhibitionList = sqlsession.selectList("search.getExhibitionbyDate", date);
		return ExhibitionList;
	}

	// 오늘을 포함해서 전시중인 전시회 정보를 받아온다.
	@Override
	public List<HashMap<String, String>> getExhibitionbyTheme() {
		List<HashMap<String,String>> ExhibitionList = sqlsession.selectList("search.getExhibitionbyTheme");
		return ExhibitionList;
	}

	// 선택한 태그에 해당하는 전시회 정보를 받아온다.
	@Override
	public List<HashMap<String, String>> getExhibitionbySelectTheme(String tag) {
		List<HashMap<String,String>> ExhibitionList = sqlsession.selectList("search.getExhibitionbySelectTheme",tag);
		return ExhibitionList;
	}

	// 해당 갤러리 이름에 해당하는 galleryNo를 받아온다.
	@Override
	public String getGalleryNobyName(String galleryName) {
		String galleryNo = sqlsession.selectOne("search.getGalleryNobyName",galleryName);
		return galleryNo;
	}

	// 해당 galleryNo를 fk로 가지는 exhibiton정보를 받아온다.
	@Override
	public List<HashMap<String, String>> getExhibitionbyLocation(String galleryNo) {
		List<HashMap<String,String>> ExhibitionList = sqlsession.selectList("search.getExhibitionbyLocation",galleryNo);
		return ExhibitionList;
	}

	////////////////////////////////////////////////////////////////////////////
	// 관리자 차트
	// 1. 먼저 모든 회원이 선호하는 태그를 가져온 후
	@Override
	public String getPreferTag() {
		List<String> TagMap = sqlsession.selectList("search.getPreferTag");
		String preferTag = "";
		for(int n=0; n<TagMap.size(); n++) {
			String str = (n==0)?"":",";
			preferTag += str+TagMap.get(n);
		}
		return preferTag;
	}

	// 2. 잘라서 각각 태그의 빈도수를 얻어온다.
	@Override
	public List<HashMap<String, String>> getChartDataByTags(String preferTag) {
		// tag, CNT
		List<HashMap<String,String>> TagList = sqlsession.selectList("search.getChartDataByTags", preferTag);
		return TagList;
	}

	// 해당 태그를 선호하는 연령대,해당회원수 를 가져온다.
	@Override
	public List<HashMap<String,String>> getAgeDataByTags(String tag) {
		List<HashMap<String,String>> ageRange = sqlsession.selectList("search.getAgeDataByTags", tag);
		return ageRange;
	} 
	
	
	
	
	
	
	
	
	
	
	
}
