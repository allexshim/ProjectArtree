package masterpiece.exhibition.search.model;

import java.util.HashMap;
import java.util.List;

public interface InterSearchDAO {
	
	// 첫화면, 모든 전시회를 받아온다.
	List<HashMap<String,String>> getAllExhibition();

}
