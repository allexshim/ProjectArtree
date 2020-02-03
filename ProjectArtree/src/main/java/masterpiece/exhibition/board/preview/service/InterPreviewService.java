package masterpiece.exhibition.board.preview.service;

import java.util.HashMap;
import java.util.List;

public interface InterPreviewService {

	List<HashMap<String, String>> getModalExhList(String key); // 전시회명 검색 - 모달에 띄울 전시회 리스트 

	int addEnd(HashMap<String, String> paraMap); // 기대평 글쓰기

	List<HashMap<String, String>> getPreviewList(HashMap<String, String> paraMap); // 기대평 글 목록 

	int getTotalCount(HashMap<String, String> paraMap); // 기대평 게시물 총 갯수

}
