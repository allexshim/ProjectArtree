package masterpiece.exhibition.search.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAO implements InterSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String,String>> getAllExhibition() {
		
		List<HashMap<String,String>> ExhibitionList = sqlsession.selectList("search.getAllExhibition");
		
		return ExhibitionList;
	}
	
	
	
	
}
