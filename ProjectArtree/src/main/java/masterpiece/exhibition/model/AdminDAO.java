package masterpiece.exhibition.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO implements InterAdminDAO {

	// 의존객체주입(DI: Dependency Injection)
	@Autowired
	private SqlSessionTemplate sqlsession;
	
}
