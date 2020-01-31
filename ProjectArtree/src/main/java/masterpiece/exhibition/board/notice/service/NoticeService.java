package masterpiece.exhibition.board.notice.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.board.notice.model.InterNoticeDAO;

@Service
public class NoticeService implements InterNoticeService {

	@Autowired
	InterNoticeDAO dao;
	
	// 공지 추가하기
	@Override
	public int addNotice(HashMap<String, String> addNotice) {
		int n = dao.addNotice(addNotice);
		return n;
	}
	
	// 공지 목록 보여주기
	@Override
	public List<HashMap<String, String>> getNotice(HashMap<String, String> noticeMap) {
		
		List<HashMap<String, String>> noticeList = null;
		noticeList = dao.getNotice(noticeMap);
		
		return noticeList;
	}

	// 공지 삭제하기
	@Override
	public int delNotice(String notNo) {
		
		int n = dao.delNotice(notNo); 
		
		return n;
	}

	@Override
	public int getCount() {
		
		int n = dao.getCount();
		
		return n;
	}

}
