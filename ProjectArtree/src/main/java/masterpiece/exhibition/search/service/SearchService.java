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
	
	
	
}
