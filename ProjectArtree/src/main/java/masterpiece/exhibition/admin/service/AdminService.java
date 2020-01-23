package masterpiece.exhibition.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.common.AES256;
import masterpiece.exhibition.admin.model.AppliedExhibitionVO;
import masterpiece.exhibition.admin.model.GalleryVO;
import masterpiece.exhibition.admin.model.InterAdminDAO;

@Service
public class AdminService implements InterAdminService {

	// 의존객체 주입 ( DI: Dependency Injection )
	@Autowired
	private InterAdminDAO dao;
	
	// 전시회등록
	@Override
	public int addExhibition(HashMap<String, String> newExhibitMap) {
		int n = dao.addExhibition(newExhibitMap);
		return n;
	}
	
	// 전시회 이미지 등록
	@Override
	public int addExhibitImage(HashMap<String, String> hashMap) {
		int n = dao.addExhibitImage(hashMap);
		return n;
	}

	// tag 가져오기
	@Override
	public HashMap<String, List<String>> getTags() {

		HashMap<String, List<String>> alltags = dao.getAllTags();
		
		
	//	System.out.println("========================== " + alltags.get("색상별"));
			
		
		return alltags;
	}

	// gallery 가져오기
	@Override
	public List<GalleryVO> getGalleries() {
		List<GalleryVO> allGalleries = dao.getGalleries();
		return allGalleries;
	}

	// gallery location 가져오기
	@Override
	public List<String> getGalleryLocations() {
		List<String> galleryLocations = dao.getGalleryLocations();
		return galleryLocations;
	}

	// gallery 검색
	@Override
	public List<GalleryVO> wordSearchShow(HashMap<String, String> paraMap) {
		List<GalleryVO> result = dao.wordSearchShow(paraMap);
		return result;
	}

	// 새로 등록할 전시회번호 채번해오기 
	@Override
	public int getApplyingno() {
		int applyingno = dao.getApplyingno();
		
		return applyingno;
	}


	
}
