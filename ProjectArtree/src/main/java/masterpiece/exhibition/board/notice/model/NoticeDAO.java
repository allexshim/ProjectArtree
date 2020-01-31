package masterpiece.exhibition.board.notice.model;

import java.util.HashMap;
import java.util.List;

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
	
	// 공지 글 개수
	@Override
	public int getCountNotice() {

		int n = sqlsession.selectOne("notice.getCountNotice");
		
		return n;
	}
	
	// 공지 목록 보여주기
	@Override
	public List<HashMap<String, String>> getNotice(HashMap<String, String> noticeMap) {
		
		List<HashMap<String, String>> noticeList = sqlsession.selectList("notice.getNotice", noticeMap);
		
		return noticeList;
	}
	
	// 공지 삭제하기
	@Override
	public int delNotice(String notNo) {
		
		int n = sqlsession.delete("notice.delNotice", notNo);
		
		return n;
	}
	
	
	
	
	

	
	
}
