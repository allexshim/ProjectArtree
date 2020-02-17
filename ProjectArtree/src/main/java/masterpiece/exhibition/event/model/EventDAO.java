package masterpiece.exhibition.event.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO implements InterEventDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 이벤트 글 작성
	@Override
	public int addEvent(HashMap<String, String> addEvent) {
		int n = sqlsession.insert("event.addEvent", addEvent); 
		return n;
	}

	// 이벤트 조회 
	@Override
	public List<HashMap<String, String>> EventList() {
		List<HashMap<String, String>> EventList = sqlsession.selectList("event.EventList");
		return EventList;
	}

	// 페이징 이벤트 조회
	@Override
	public List<HashMap<String, String>> EventListPage(HashMap<String, String> map) {
		List<HashMap<String, String>> EventListPage = sqlsession.selectList("event.EventListPage", map);
		return EventListPage;
	}

	// 이벤트 상세 조회
	@Override
	public List<HashMap<String, String>> eventDetail(String eventNo) {		
		List<HashMap<String, String>> eventDetail = sqlsession.selectList("event.eventDetail", eventNo);		
		return eventDetail;
	}

	// 이벤트 삭제
	@Override
	public void delEvent(String eventNo) {
		sqlsession.delete("event.delEvent",eventNo);
	}

	// 수정할 이벤트 정보 가져오기
	@Override
	public HashMap<String, String> eventDetail2(String no) {
		HashMap<String, String> map = sqlsession.selectOne("event.eventDetail2",no);
		return map;
	}

	@Override
	public int modifyEvent(HashMap<String, String> map) {
		int n = sqlsession.update("event.modifyEvent",map);
		return n;
	}
	
	// 메일보낼 전체 회원 이메일 구하기
	@Override
	public List<HashMap<String, String>> getMemberEmail() {
		List<HashMap<String, String>> memberList = sqlsession.selectList("event.getMemberEmail");
		return memberList;
	}

	@Override
	public String getEventImg(String fk_exhibitionno) {
		String addEventImg = sqlsession.selectOne("event.getEventImg", fk_exhibitionno);
		return addEventImg;
	}

}
