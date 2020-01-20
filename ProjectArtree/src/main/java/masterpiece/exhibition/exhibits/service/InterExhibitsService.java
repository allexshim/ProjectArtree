package masterpiece.exhibition.exhibits.service;

import java.util.HashMap;
import java.util.List;

public interface InterExhibitsService {

	List<HashMap<String, Object>> getExhList(HashMap<String, String> paraMap); // 전시회 목록 불러오기

}
