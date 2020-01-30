package masterpiece.exhibition.admin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import masterpiece.exhibition.exhibits.model.ExhibitsVO;

@Repository
public class AdminDAO implements InterAdminDAO {

	// 의존객체 주입 ( DI: Dependency Injection )
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 전시회등록
	@Override
	public int applyExhibition(HashMap<String, String> newExhibitMap) {
		int n = sqlsession.insert("admin.applyExhibition", newExhibitMap);
		return n;
	}

	// 전시회 이미지 등록
	@Override
	public int addExhibitImage(HashMap<String, String> hashMap) {
		int n = sqlsession.insert("admin.addExhibitImage", hashMap);
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
	public List<GalleryVO> getGalleries() {
		List<GalleryVO> galleries = sqlsession.selectList("admin.getGalleries");
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

	// 새로 등록할 전시회번호 채번해오기 
	@Override
	public int getApplyingno() {
		int applyingno = sqlsession.selectOne("admin.getApplyingno");
		return applyingno;
	}

	// 전시회목록 가져오기
	@Override
	public List<ExhibitsVO> getExhibitionList() {
		List<ExhibitsVO> exhibitionList = sqlsession.selectList("admin.getExhibitionList");
		return exhibitionList;
	}

	// 전시회정보 가져오기
	@Override
	public HashMap<String, String> getExhibitionDetail(String no) {
		HashMap<String, String> exhibitionInfo = sqlsession.selectOne("admin.getExhibitionDetail", no);
		return exhibitionInfo;
	}

	// 새로운 전시회목록 가져오기
	@Override
	public List<ExhibitsVO> getNewExhibitionList() {
		List<ExhibitsVO> exhibitionList = sqlsession.selectList("admin.getNewExhibitionList");
		return exhibitionList;
	}

	// 전시 대기 -> 전시중으로 바꾸기
	@Override
	public int changeExhibitStatus(String exhibitionno) {
		int n = sqlsession.update("admin.changeExhibitStatus", exhibitionno);
		return n;
	}

	// 종료된 전시목록 조회
	@Override
	public List<ExhibitsVO> getAfterExhibitionList() {
		List<ExhibitsVO> exhibitionList = sqlsession.selectList("admin.getAfterExhibitionList");
		return exhibitionList;
	}

	// 검토할 전시회 목록 조회
	@Override
	public List<HashMap<String, String>> getAppliedExhibitionList() {
		List<HashMap<String, String>> exhibitionList = sqlsession.selectList("admin.getAppliedExhibitionList");
		return exhibitionList;
	}

	// 검토할 전시회 조회
	@Override
	public HashMap<String, String> getAppliedExhibitionDetail(String no) {
		HashMap<String, String> exhibitionInfo = sqlsession.selectOne("admin.getAppliedExhibitionDetail", no);
		return exhibitionInfo;
	}

	// 이미지 가져오기
	@Override
	public List<HashMap<String, String>> getAppliedExhibitionImage(String no) {
		List<HashMap<String, String>> imgList = sqlsession.selectList("admin.getAppliedExhibitionImage", no);
		return imgList;
	}

	// 등록할 전시회번호 채번해오기
	@Override
	public String getExhibitionno() {
		String exhibitionno = sqlsession.selectOne("admin.getExhibitionno");
		return exhibitionno;
	}

	// 검토목록에 있던 전시회를 전시예정으로 변경
	@Override
	public int displayNewExhibition(HashMap<String, String> newExhibitMap) {
		int n = sqlsession.insert("admin.displayNewExhibition", newExhibitMap);
		
		System.out.println("===========exhibitionno============ " + newExhibitMap.get("exhibitionno"));
		System.out.println("===========fk_galleryno============ " + newExhibitMap.get("fk_galleryno"));
		System.out.println("===========exhibitionname============ " + newExhibitMap.get("exhibitionname"));
		System.out.println("===========applier============ " + newExhibitMap.get("applier"));
		System.out.println("===========author============ " + newExhibitMap.get("author"));
		System.out.println("===========startdate============ " + newExhibitMap.get("startdate"));
		System.out.println("===========openclosetime============ " + newExhibitMap.get("openclosetime"));
		System.out.println("===========price============ " + newExhibitMap.get("price"));
		System.out.println("=======================");
		
		return n;
	}

	// 전시회의 이미지 테이블에 insert
	@Override
	public int displayNewExhibitionImg(HashMap<String, String> newExhibitImgMap) {
		int m = sqlsession.insert("admin.displayNewExhibitionImg", newExhibitImgMap);
		System.out.println("===========mainposter============ " + newExhibitImgMap.get("mainposter"));
		System.out.println("===========image1============ " + newExhibitImgMap.get("image1"));
		System.out.println("===========image2============ " + newExhibitImgMap.get("image2"));
		System.out.println("===========image3============ " + newExhibitImgMap.get("image3"));
		System.out.println("===========image1info============ " + newExhibitImgMap.get("image1info"));
		System.out.println("===========image2info============ " + newExhibitImgMap.get("image2info"));
		return m;
	}


	
}
