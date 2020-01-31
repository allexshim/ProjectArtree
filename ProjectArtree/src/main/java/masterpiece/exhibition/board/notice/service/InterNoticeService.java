package masterpiece.exhibition.board.notice.service;

import java.util.HashMap;
import java.util.List;

public interface InterNoticeService {
	
	// 공지 추가
	int addNotice(HashMap<String, String> addNotice);
	
	// 공지 게시글의 수
	int getCountNotice();
	
	// 공지 목록
	List<HashMap<String, String>> getNotice(HashMap<String, String> noticeMap);
	
	// 공지 삭제
	int delNotice(String notNo);
	
}
