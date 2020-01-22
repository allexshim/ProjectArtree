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
	
	
	
	
	
	
	
	
	
	
}
