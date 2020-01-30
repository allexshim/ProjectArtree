package masterpiece.exhibition.board.notice.service;

import java.util.HashMap;
import java.util.List;

public interface InterNoticeService {

	int addNotice(HashMap<String, String> addNotice);

	List<HashMap<String, String>> getNotice(HashMap<String, String> searchMap);

}
