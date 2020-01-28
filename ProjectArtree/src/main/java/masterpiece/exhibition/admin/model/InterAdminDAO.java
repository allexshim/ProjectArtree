package masterpiece.exhibition.admin.model;

import java.util.HashMap;
import java.util.List;

import masterpiece.exhibition.exhibits.model.ExhibitsVO;

public interface InterAdminDAO {

	// 전시회등록
	int addExhibition(HashMap<String, String> newExhibitMap);

	// 전시회 이미지 등록
	int addExhibitImage(HashMap<String, String> hashMap);
	
	// tag 가져오기
	HashMap<String, List<String>> getAllTags();

	// gallery 가져오기
	List<GalleryVO> getGalleries();

	// gallery location 가져오기
	List<String> getGalleryLocations();

	// gallery 검색
	List<GalleryVO> wordSearchShow(HashMap<String, String> paraMap);

	// 새로 등록할 전시회번호 채번해오기 
	int getApplyingno();

	// 전시회목록 가져오기
	List<ExhibitsVO> getExhibitionList();

	// 전시회정보 가져오기
	HashMap<String, String> getExhibitionDetail(String no);

	

}
