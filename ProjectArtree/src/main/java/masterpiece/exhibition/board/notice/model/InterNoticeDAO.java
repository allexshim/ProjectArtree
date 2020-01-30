package masterpiece.exhibition.board.notice.model;

import java.util.HashMap;

public interface InterNoticeDAO {
	
	
	// 공지 추가하기
	int addNotice(HashMap<String, String> addNotice);

}
