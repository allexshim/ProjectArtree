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

		List<HashMap<String, String>> communityList = null;
		communityList = dao.getCommunity(searchMap);
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

	// 해당 글번호의 글 정보 가져오기
	@Override
	public HashMap<String, String> getCommunityDetail(String no) {
		HashMap<String, String> communityDetail = dao.getCommunityDetail(no);
		return communityDetail;
	}

	// 글 수정하기 
	@Override
	public int modifyCommunity(HashMap<String, String> modifycommu) {
		int n = dao.modifyCommunity(modifycommu);
		return n;
	}

	// 새 댓글 등록하기
	@Override
	public int addComment(HashMap<String, String> comment) {
		int n = dao.addComment(comment);
		return n;
	}

}
