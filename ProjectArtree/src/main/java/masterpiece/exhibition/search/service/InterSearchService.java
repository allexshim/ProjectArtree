package masterpiece.exhibition.search.service;

import java.util.HashMap;
import java.util.List;

public interface InterSearchService {

	// 모든 전시회 정보를 받아온다.
	List<HashMap<String,String>> getAllExhibition();

}
