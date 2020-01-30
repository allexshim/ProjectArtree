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
	public List<HashMap<String, String>> getNotice(HashMap<String, String> searchMap) {
		
		return null;
	}

}
