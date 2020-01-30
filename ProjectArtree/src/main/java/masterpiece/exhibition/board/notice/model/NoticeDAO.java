package masterpiece.exhibition.board.notice.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements InterNoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 공지 추가하기
	@Override
	public int addNotice(HashMap<String, String> addNotice) {
		int n = sqlsession.insert("notice.addNotice",addNotice);
		return n;
	}

	
	
}
