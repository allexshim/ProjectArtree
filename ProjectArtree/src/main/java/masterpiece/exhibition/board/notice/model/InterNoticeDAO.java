package masterpiece.exhibition.board.notice.model;

import java.util.HashMap;
import java.util.List;

public interface InterNoticeDAO {
	
	
	// 공지 추가하기
	int addNotice(HashMap<String, String> addNotice);
	
	// 게시물 수 조회
	int getCountNotice();
	
	// 공지 목록 보여주기
	List<HashMap<String, String>> getNotice(HashMap<String, String> noticeMap);
	
	// 공지 삭제
	int delNotice(String notNo);
	
	// faq목록
	List<HashMap<String, String>> getFAQ();
	
	
	
	

}
