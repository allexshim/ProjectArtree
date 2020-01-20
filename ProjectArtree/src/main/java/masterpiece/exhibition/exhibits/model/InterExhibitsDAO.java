package masterpiece.exhibition.exhibits.model;

import java.util.HashMap;
import java.util.List;

public interface InterExhibitsDAO {

	List<HashMap<String, Object>> getExhList(HashMap<String, String> paraMap); // 전시회 목록 불러오기

}
