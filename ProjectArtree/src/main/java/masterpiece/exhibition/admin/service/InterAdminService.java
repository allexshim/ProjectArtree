package masterpiece.exhibition.admin.service;

import java.util.HashMap;
import java.util.List;

import masterpiece.exhibition.admin.model.GalleryVO;

public interface InterAdminService {

	// ------------------------ 트랜잭션 처리 ------------------------ //
	
	// 전시회등록
	int addExhibition(HashMap<String, String> newExhibitMap);
	
	// 전시회 이미지 등록
	int addExhibitimage(HashMap<String, String> hashMap);

	// ----------------------------------------------------------- //
	
	// tag 가져오기
	HashMap<String, List<String>> getTags();

	// gallery 가져오기
	List<GalleryVO> getGalleries(HashMap<String,String> paraMap);

	// gallery location 가져오기
	List<String> getGalleryLocations();

	// gallery 검색
	List<GalleryVO> wordSearchShow(HashMap<String, String> paraMap);



}
