package masterpiece.exhibition.exhibits.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExhibitsDAO implements InterExhibitsDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	/////////////// 전시회 목록 불러오기 /////////////////
	@Override
	public List<HashMap<String, Object>> getExhList(HashMap<String, String> paraMap) {
		List<HashMap<String, Object>> ExhListMap = sql.selectList("exhibits.getExhList", paraMap);
		return ExhListMap;
	}

}
