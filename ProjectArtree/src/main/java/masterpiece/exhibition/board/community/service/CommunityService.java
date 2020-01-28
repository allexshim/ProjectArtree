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
	
	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
	@Override
	public List<HashMap<String, String>> getAllExhibit() {
		List<HashMap<String, String>> exhibitionList = dao.getAllExhibit();
		return exhibitionList;
	}
 
	
	
}
