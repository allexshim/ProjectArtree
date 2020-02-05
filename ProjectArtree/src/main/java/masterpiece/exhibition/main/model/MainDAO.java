package masterpiece.exhibition.main.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO implements InterMainDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	// ajax로 호출, 인기 전시회 top3를 가지고 옵니다.
	@Override
	public List<HashMap<String, String>> getMostPolular() {
		List<HashMap<String,String>> ExhibitionList = sqlsession.selectList("main.getMostPolular");
		return ExhibitionList;
	}

	// ajax로 호출, 신규 전시회 top3를 가지고 옵니다.
	@Override
	public List<HashMap<String, String>> getNewest() {
		List<HashMap<String,String>> ExhibitionList = sqlsession.selectList("main.getNewest");
		return ExhibitionList;
	}

	// ajax ~ 종료임박 전시회 종료일 빠른순으로 3개 가져오기
	@Override
	public List<HashMap<String, String>> getEndSoon() {
		List<HashMap<String,String>> ExhibitionList = sqlsession.selectList("main.getEndSoon");
		return ExhibitionList;
	}

	// 해당 회원/ 전체회원의 선호 태그를 알아온다.
	@Override
	public String getPreferTag(String idx) {
		
		List<String> TagMap = sqlsession.selectList("main.getPreferTag", idx);
		String preferTag = "";
		for(int n=0; n<TagMap.size(); n++) {
			String str = (n==0)?"":",";
			preferTag += str+TagMap.get(n);
		}
		return preferTag;
	}

	// 가져온 선호 태그를 split으로 자른 후, 가장 선호하는 태그 1개를 가져온다.
	@Override
	public String getFavorTag(String preferTag) {
		String FavorTag = sqlsession.selectOne("main.getFavorTag", preferTag);	
		return FavorTag;
	} 

	// 가장 선호하는 태그와 일치하는 전시회 중, 조회수가 높은 순으로 3개 가져온다.
	@Override
	public List<HashMap<String, String>> getFavorExhibition(String favorTag) {
		List<HashMap<String,String>> ExhibitionList = sqlsession.selectList("main.getFavorExhibition", favorTag);
		return ExhibitionList;
	}

	// ajax로 호출, 이벤트 등록 빠른순으로 3개 가져오기
	@Override
	public List<HashMap<String, String>> getNewEvent() {
		List<HashMap<String,String>> eventList = sqlsession.selectList("main.getNewEvent");
		return eventList;
	}
	
	// 성별차트
	@Override
	public List<HashMap<String, Object>> getGenderChart() {
		List<HashMap<String, Object>> getGenderChart = sqlsession.selectList("main.getGenderChart");
		return getGenderChart;
	}

	@Override
	public int getTotalMember() {
		int n = sqlsession.selectOne("main.getTotalMember");
		return n;
	}
	
	
	
	
	
}
