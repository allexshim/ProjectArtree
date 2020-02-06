package masterpiece.exhibition.event.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.event.model.InterEventDAO;

@Service
public class EventService implements InterEventService {
	
	@Autowired
	InterEventDAO dao;
	
	// 이벤트 글 등록
	@Override
	public int addEvent(HashMap<String, String> addEvent) {
		int n = dao.addEvent(addEvent);
		return n;
	}

	// 이벤트 리스트 조회
	@Override
	public List<HashMap<String, String>> EventList() {
		List<HashMap<String, String>> EventList = dao.EventList();
		return EventList;
	}

	// 페이징 이벤트 리스트 조회
	@Override
	public List<HashMap<String, String>> EventListPage(HashMap<String, String> map) {
		List<HashMap<String, String>> EventListPage = dao.EventListPage(map);
		return EventListPage;
	}

	// 이벤트 상세 조회
	@Override
	public List<HashMap<String, String>> eventDetail(String eventNo) {
		List<HashMap<String, String>> eventDetail = dao.eventDetail(eventNo);
		return eventDetail;
	}

	// 이벤트 삭제
	@Override
	public void delEvent(String eventNo) {
		dao.delEvent(eventNo);
	}

	// 수정할 이벤트 정보 가져오기
	@Override
	public HashMap<String, String> eventDetail2(String no) {
		HashMap<String, String> map = dao.eventDetail2(no);
		return map;
	}

	// 이벤트 수정
	@Override
	public int modifyEvent(HashMap<String, String> map) {
		int n = dao.modifyEvent(map);
		return n;
	}
	
	// 메일 보낼 회원 이메일
	@Override
	public List<HashMap<String, String>> getMemberEmail() {
		List<HashMap<String, String>> memberList = dao.getMemberEmail();
		return memberList;
	}

}
