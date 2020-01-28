package masterpiece.exhibition.board.community.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAO implements InterCommunityDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
	@Override
	public List<HashMap<String, String>> getAllExhibit() {
		List<HashMap<String, String>> exhibitionList = sqlsession.selectList("community.getAllExhibit");
		return exhibitionList;
	}

}
