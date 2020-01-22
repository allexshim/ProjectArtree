package masterpiece.exhibition.admin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO implements InterAdminDAO {

	// 의존객체 주입 ( DI: Dependency Injection )
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 전시회등록
	@Override
	public int addExhibition(HashMap<String, String> newExhibitMap) {
		int n = sqlsession.insert("admin.addExhibition", newExhibitMap);
		return n;
	}

	// 전시회 이미지 등록
	@Override
	public int addExhibitimage(HashMap<String, String> hashMap) {
		int n = sqlsession.insert("admin.addExhibitimage", hashMap);
		return n;
	}
	
	// tag 가져오기
	@Override
	public HashMap<String, List<String>> getAllTags() {
		
		HashMap<String, List<String>> alltags = new HashMap<String, List<String>>();
		
		List<String> types = sqlsession.selectList("admin.getTypes");
		
		for(String type : types) {
			
			List<String> keywords = sqlsession.selectList("admin.getKeywords", type);
			alltags.put(type, keywords);
			
		}
		
		return alltags;
	}

	// gallery 가져오기
	@Override
	public List<GalleryVO> getGalleries(HashMap<String,String> paraMap) {
		List<GalleryVO> galleries = sqlsession.selectList("admin.getGalleries", paraMap);
		return galleries;
	}

	// gallery location 가져오기
	@Override
	public List<String> getGalleryLocations() {
		List<String> galleryLocations = sqlsession.selectList("admin.getGalleryLocations");
		return galleryLocations;
	}

	// gallery 검색
	@Override
	public List<GalleryVO> wordSearchShow(HashMap<String, String> paraMap) {
		List<GalleryVO> result = sqlsession.selectList("admin.wordSearchShow", paraMap);
		return result;
	}


	
}
