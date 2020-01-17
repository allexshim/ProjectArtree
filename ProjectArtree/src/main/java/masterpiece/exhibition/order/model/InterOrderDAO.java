package masterpiece.exhibition.order.model;

import java.util.HashMap;
import java.util.List;

public interface InterOrderDAO {
	
	List<HashMap<String, String>> getEx(HashMap<String, String> map); // 전시회 정보 조회 

}
