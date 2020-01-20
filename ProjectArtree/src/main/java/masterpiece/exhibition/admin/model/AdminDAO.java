package masterpiece.exhibition.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO implements InterAdminDAO {

	// 의존객체 주입 ( DI: Dependency Injection )
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 전시회등록
	@Override
	public int addExhibition(AppliedExhibitionVO avo) {
		int n = sqlsession.insert("admin.addExhibition", avo);
		return n;
	}
	
}
