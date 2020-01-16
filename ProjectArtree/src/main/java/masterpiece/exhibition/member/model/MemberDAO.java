package masterpiece.exhibition.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements InterMemberDAO {

	@Autowired  
	private SqlSessionTemplate sqlsession;

	@Override
	public int joinInsert(MemberVO mvo) {
		int n = sqlsession.insert("member.joinInsert", mvo);
		return n;
	}
}
