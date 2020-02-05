package masterpiece.exhibition.event.service;

import java.util.HashMap;
import java.util.List;

public interface InterEventService {
	
	// 이벤트 글 등록하기
	int addEvent(HashMap<String, String> addEvent); 
	
	// 이벤트 리스트 조회
	List<HashMap<String, String>> EventList();

	// 페이징 이벤트 리스트 조회
	List<HashMap<String, String>> EventListPage(HashMap<String, String> map);

	// 이벤트 상세 조회
	List<HashMap<String, String>> eventDetail(String eventNo);

	// 이벤트 삭제
	void delEvent(String eventNo);

	// 수정할 이벤트 정보 가져오기
	HashMap<String, String> eventDetail2(String no);

	// 이벤트 수정
	int modifyEvent(HashMap<String, String> map);
	
	// 메일 보낼 회원 이메일 구하기
	List<HashMap<String, String>> getMemberEmail();

}
