package masterpiece.exhibition.order.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO implements InterOrderDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;	
	
	@Override
	public List<HashMap<String,String>> getEx(HashMap<String, String> map) {
		List<HashMap<String,String>> exList =  sqlsession.selectList("order.exList",map);
		return exList;
	}
	
}
