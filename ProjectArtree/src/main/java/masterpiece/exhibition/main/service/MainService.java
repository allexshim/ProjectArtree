package masterpiece.exhibition.main.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.main.model.InterMainDAO;

@Service
public class MainService implements InterMainService {

	@Autowired
	InterMainDAO dao;

	// ajax로 호출, 인기 전시회 top3를 가지고 옵니다.
	@Override
	public List<HashMap<String, String>> getMostPolular() {
		List<HashMap<String,String>> ExhibitionList = dao.getMostPolular();
		return ExhibitionList;
	}
	
	// ajax로 호출, 신규 전시회 top3를 가지고 옵니다.
	@Override
	public List<HashMap<String, String>> getNewest() {
		List<HashMap<String,String>> ExhibitionList = dao.getNewest();
		return ExhibitionList;
	}

	// ajax ~ 종료임박 전시회 종료일 빠른순으로 3개 가져오기
	@Override
	public List<HashMap<String, String>> getEndSoon() {
		List<HashMap<String,String>> ExhibitionList = dao.getEndSoon();
		return ExhibitionList;
	}

	// ajax ~ 사용자가 선호하는 태그가 들어간 전시회를 조회수 높은 순으로 3개 가져오기
	@Override
	public List<HashMap<String, String>> getPreference(String idx) {
		
		// 로그인한 회원/ 전체 회원의 선호 태그 알아오기
		String preferTag = dao.getPreferTag(idx);

		// 가져온 선호 태그를 split으로 자른 후, 가장 선호하는 태그 1개를 가져온다.
		String favorTag = dao.getFavorTag(preferTag);

		// 가장 선호하는 태그와 일치하는 전시회 중, 조회수가 높은 순으로 3개 가져온다.
	    List<HashMap<String,String>> ExhibitionList = dao.getFavorExhibition(favorTag);
		return ExhibitionList;
	}

	// ajax로 호출, 이벤트 등록 빠른순으로 3개 가져오기
	@Override
	public List<HashMap<String, String>> getNewEvent() {
		List<HashMap<String,String>> eventList = dao.getNewEvent();
		return eventList;
	}
	
	// 성별차트
	@Override
	public List<HashMap<String, Object>> getGenderChart() {
		List<HashMap<String, Object>> getGenderChart = dao.getGenderChart();
		return getGenderChart;
	}
	
	// 총 회원수
	@Override
	public int getTotalMember() {
		int n = dao.getTotalMember();
		return n;
	}
	
	
	
}
