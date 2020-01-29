package masterpiece.exhibition.board.community.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.board.community.model.InterCommunityDAO;

@Service
public class CommunityService implements InterCommunityService {

	@Autowired
	InterCommunityDAO dao;
	
	// 목록 불러오기
	@Override
	public List<HashMap<String, String>> getCommunity(HashMap<String, String> searchMap) {
		List<HashMap<String, String>> communityList = dao.getCommunity(searchMap);
		return communityList;
	}
	
	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
	@Override
	public List<HashMap<String, String>> getExhibit(String searchWord) {
		List<HashMap<String, String>> exhibitionList = dao.getExhibit(searchWord);
		return exhibitionList;
	}

	// 새 글 추가하기
	@Override
	public int addCommunity(HashMap<String, String> addCommunity) {
		int n = dao.addCommunity(addCommunity);
		return n;
	}


 
	
	
}
